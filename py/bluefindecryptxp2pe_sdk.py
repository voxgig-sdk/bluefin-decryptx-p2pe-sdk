# BluefinDecryptxP2pe SDK

from utility.voxgig_struct import voxgig_struct as vs
from core.utility_type import BluefinDecryptxP2peUtility
from core.spec import BluefinDecryptxP2peSpec
from core import helpers

# Load utility registration (populates Utility._registrar)
from utility import register

# Load features
from feature.base_feature import BluefinDecryptxP2peBaseFeature
from features import _make_feature


class BluefinDecryptxP2peSDK:

    def __init__(self, options=None):
        self.mode = "live"
        self.features = []
        self.options = None

        utility = BluefinDecryptxP2peUtility()
        self._utility = utility

        from config import make_config
        config = make_config()

        self._rootctx = utility.make_context({
            "client": self,
            "utility": utility,
            "config": config,
            "options": options if options is not None else {},
            "shared": {},
        }, None)

        self.options = utility.make_options(self._rootctx)

        if vs.getpath(self.options, "feature.test.active") is True:
            self.mode = "test"

        self._rootctx.options = self.options

        # Add features in the resolved order (make_options puts an explicit
        # list order first, else defaults to test-first). Ordering matters: the
        # `test` feature installs the base mock transport and the transport
        # features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        # current, so `test` must be added before them to sit at the base.
        feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
        if feature_opts is not None:
            featureorder = vs.getpath(self.options, "__derived__.featureorder")
            if isinstance(featureorder, list):
                for fname in featureorder:
                    fopts = helpers.to_map(feature_opts.get(fname))
                    if fopts is not None and fopts.get("active") is True:
                        utility.feature_add(self._rootctx, _make_feature(fname))

        # Add extension features.
        extend = vs.getprop(self.options, "extend")
        if isinstance(extend, list):
            for f in extend:
                if isinstance(f, dict) or (hasattr(f, "get_name") and callable(f.get_name)):
                    utility.feature_add(self._rootctx, f)

        # Initialize features.
        for f in self.features:
            utility.feature_init(self._rootctx, f)

        utility.feature_hook(self._rootctx, "PostConstruct")

        # #BuildFeatures

    def options_map(self):
        out = vs.clone(self.options)
        if isinstance(out, dict):
            return out
        return {}

    def get_utility(self):
        return BluefinDecryptxP2peUtility.copy(self._utility)

    def get_root_ctx(self):
        return self._rootctx

    def prepare(self, fetchargs=None):
        utility = self._utility

        if fetchargs is None:
            fetchargs = {}

        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "prepare",
            "ctrl": ctrl,
        }, self._rootctx)

        options = self.options

        path = vs.getprop(fetchargs, "path") or ""
        if not isinstance(path, str):
            path = ""

        method = vs.getprop(fetchargs, "method") or "GET"
        if not isinstance(method, str):
            method = "GET"

        params = helpers.to_map(vs.getprop(fetchargs, "params"))
        if params is None:
            params = {}
        query = helpers.to_map(vs.getprop(fetchargs, "query"))
        if query is None:
            query = {}

        headers = utility.prepare_headers(ctx)

        base = vs.getprop(options, "base") or ""
        if not isinstance(base, str):
            base = ""
        prefix = vs.getprop(options, "prefix") or ""
        if not isinstance(prefix, str):
            prefix = ""
        suffix = vs.getprop(options, "suffix") or ""
        if not isinstance(suffix, str):
            suffix = ""

        ctx.spec = BluefinDecryptxP2peSpec({
            "base": base,
            "prefix": prefix,
            "suffix": suffix,
            "path": path,
            "method": method,
            "params": params,
            "query": query,
            "headers": headers,
            "body": vs.getprop(fetchargs, "body"),
            "step": "start",
        })

        # Merge user-provided headers.
        uh = vs.getprop(fetchargs, "headers")
        if isinstance(uh, dict):
            for k, v in uh.items():
                ctx.spec.headers[k] = v

        _, err = utility.prepare_auth(ctx)
        if err is not None:
            raise err

        fetchdef, err = utility.make_fetch_def(ctx)
        if err is not None:
            raise err

        return fetchdef

    def direct(self, fetchargs=None):
        utility = self._utility

        try:
            fetchdef = self.prepare(fetchargs)
        except Exception as err:
            # direct() is the raw-HTTP escape hatch: it never raises, it
            # returns a result object callers branch on via result["ok"].
            return {"ok": False, "err": err}

        if fetchargs is None:
            fetchargs = {}
        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "direct",
            "ctrl": ctrl,
        }, self._rootctx)

        url = fetchdef.get("url", "")
        fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

        if fetch_err is not None:
            return {"ok": False, "err": fetch_err}

        if fetched is None:
            return {
                "ok": False,
                "err": ctx.make_error("direct_no_response", "response: undefined"),
            }

        if isinstance(fetched, dict):
            status = helpers.to_int(vs.getprop(fetched, "status"))
            headers = vs.getprop(fetched, "headers") or {}

            # No-body responses (204, 304) and explicit zero content-length
            # must skip JSON parsing — calling json() on an empty body raises.
            content_length = None
            if isinstance(headers, dict):
                content_length = headers.get("content-length")
            no_body = status in (204, 304) or str(content_length) == "0"

            json_data = None
            if not no_body:
                jf = vs.getprop(fetched, "json")
                if callable(jf):
                    try:
                        json_data = jf()
                    except Exception:
                        # Non-JSON body (e.g. text/plain, text/html). Surface
                        # status + headers but leave data as None.
                        json_data = None

            return {
                "ok": status >= 200 and status < 300,
                "status": status,
                "headers": headers,
                "data": json_data,
            }

        return {
            "ok": False,
            "err": ctx.make_error("direct_invalid", "invalid response type"),
        }


    def Attestation(self, data=None) -> "AttestationEntity":
        """Entity factory: client.Attestation().list() / client.Attestation().load({"id": ...})."""
        from entity.attestation_entity import AttestationEntity
        return AttestationEntity(self, data)


    def Client(self, data=None) -> "ClientEntity":
        """Entity factory: client.Client().list() / client.Client().load({"id": ...})."""
        from entity.client_entity import ClientEntity
        return ClientEntity(self, data)


    def CreateResult(self, data=None) -> "CreateResultEntity":
        """Entity factory: client.CreateResult().list() / client.CreateResult().load({"id": ...})."""
        from entity.create_result_entity import CreateResultEntity
        return CreateResultEntity(self, data)


    def Decryption(self, data=None) -> "DecryptionEntity":
        """Entity factory: client.Decryption().list() / client.Decryption().load({"id": ...})."""
        from entity.decryption_entity import DecryptionEntity
        return DecryptionEntity(self, data)


    def Device(self, data=None) -> "DeviceEntity":
        """Entity factory: client.Device().list() / client.Device().load({"id": ...})."""
        from entity.device_entity import DeviceEntity
        return DeviceEntity(self, data)


    def DeviceBuild(self, data=None) -> "DeviceBuildEntity":
        """Entity factory: client.DeviceBuild().list() / client.DeviceBuild().load({"id": ...})."""
        from entity.device_build_entity import DeviceBuildEntity
        return DeviceBuildEntity(self, data)


    def DeviceCustodyDetail(self, data=None) -> "DeviceCustodyDetailEntity":
        """Entity factory: client.DeviceCustodyDetail().list() / client.DeviceCustodyDetail().load({"id": ...})."""
        from entity.device_custody_detail_entity import DeviceCustodyDetailEntity
        return DeviceCustodyDetailEntity(self, data)


    def DeviceCustodyList(self, data=None) -> "DeviceCustodyListEntity":
        """Entity factory: client.DeviceCustodyList().list() / client.DeviceCustodyList().load({"id": ...})."""
        from entity.device_custody_list_entity import DeviceCustodyListEntity
        return DeviceCustodyListEntity(self, data)


    def DeviceList(self, data=None) -> "DeviceListEntity":
        """Entity factory: client.DeviceList().list() / client.DeviceList().load({"id": ...})."""
        from entity.device_list_entity import DeviceListEntity
        return DeviceListEntity(self, data)


    def DeviceReceiveResult(self, data=None) -> "DeviceReceiveResultEntity":
        """Entity factory: client.DeviceReceiveResult().list() / client.DeviceReceiveResult().load({"id": ...})."""
        from entity.device_receive_result_entity import DeviceReceiveResultEntity
        return DeviceReceiveResultEntity(self, data)


    def DeviceRkiActivateResult(self, data=None) -> "DeviceRkiActivateResultEntity":
        """Entity factory: client.DeviceRkiActivateResult().list() / client.DeviceRkiActivateResult().load({"id": ...})."""
        from entity.device_rki_activate_result_entity import DeviceRkiActivateResultEntity
        return DeviceRkiActivateResultEntity(self, data)


    def DeviceState(self, data=None) -> "DeviceStateEntity":
        """Entity factory: client.DeviceState().list() / client.DeviceState().load({"id": ...})."""
        from entity.device_state_entity import DeviceStateEntity
        return DeviceStateEntity(self, data)


    def DeviceType(self, data=None) -> "DeviceTypeEntity":
        """Entity factory: client.DeviceType().list() / client.DeviceType().load({"id": ...})."""
        from entity.device_type_entity import DeviceTypeEntity
        return DeviceTypeEntity(self, data)


    def InjectKey(self, data=None) -> "InjectKeyEntity":
        """Entity factory: client.InjectKey().list() / client.InjectKey().load({"id": ...})."""
        from entity.inject_key_entity import InjectKeyEntity
        return InjectKeyEntity(self, data)


    def Kif(self, data=None) -> "KifEntity":
        """Entity factory: client.Kif().list() / client.Kif().load({"id": ...})."""
        from entity.kif_entity import KifEntity
        return KifEntity(self, data)


    def Location(self, data=None) -> "LocationEntity":
        """Entity factory: client.Location().list() / client.Location().load({"id": ...})."""
        from entity.location_entity import LocationEntity
        return LocationEntity(self, data)


    def Partner(self, data=None) -> "PartnerEntity":
        """Entity factory: client.Partner().list() / client.Partner().load({"id": ...})."""
        from entity.partner_entity import PartnerEntity
        return PartnerEntity(self, data)


    def Shipment(self, data=None) -> "ShipmentEntity":
        """Entity factory: client.Shipment().list() / client.Shipment().load({"id": ...})."""
        from entity.shipment_entity import ShipmentEntity
        return ShipmentEntity(self, data)


    def Success(self, data=None) -> "SuccessEntity":
        """Entity factory: client.Success().list() / client.Success().load({"id": ...})."""
        from entity.success_entity import SuccessEntity
        return SuccessEntity(self, data)


    def Transaction(self, data=None) -> "TransactionEntity":
        """Entity factory: client.Transaction().list() / client.Transaction().load({"id": ...})."""
        from entity.transaction_entity import TransactionEntity
        return TransactionEntity(self, data)


    def UpdateResult(self, data=None) -> "UpdateResultEntity":
        """Entity factory: client.UpdateResult().list() / client.UpdateResult().load({"id": ...})."""
        from entity.update_result_entity import UpdateResultEntity
        return UpdateResultEntity(self, data)


    def User(self, data=None) -> "UserEntity":
        """Entity factory: client.User().list() / client.User().load({"id": ...})."""
        from entity.user_entity import UserEntity
        return UserEntity(self, data)



    @classmethod
    def test(cls, testopts=None, sdkopts=None) -> "BluefinDecryptxP2peSDK":
        if sdkopts is None:
            sdkopts = {}
        sdkopts = vs.clone(sdkopts)
        if not isinstance(sdkopts, dict):
            sdkopts = {}

        if testopts is None:
            testopts = {}
        testopts = vs.clone(testopts)
        if not isinstance(testopts, dict):
            testopts = {}
        testopts["active"] = True

        vs.setpath(sdkopts, "feature.test", testopts)

        sdk = cls(sdkopts)
        sdk.mode = "test"

        return sdk


from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entity.attestation_entity import AttestationEntity
    from entity.client_entity import ClientEntity
    from entity.create_result_entity import CreateResultEntity
    from entity.decryption_entity import DecryptionEntity
    from entity.device_entity import DeviceEntity
    from entity.device_build_entity import DeviceBuildEntity
    from entity.device_custody_detail_entity import DeviceCustodyDetailEntity
    from entity.device_custody_list_entity import DeviceCustodyListEntity
    from entity.device_list_entity import DeviceListEntity
    from entity.device_receive_result_entity import DeviceReceiveResultEntity
    from entity.device_rki_activate_result_entity import DeviceRkiActivateResultEntity
    from entity.device_state_entity import DeviceStateEntity
    from entity.device_type_entity import DeviceTypeEntity
    from entity.inject_key_entity import InjectKeyEntity
    from entity.kif_entity import KifEntity
    from entity.location_entity import LocationEntity
    from entity.partner_entity import PartnerEntity
    from entity.shipment_entity import ShipmentEntity
    from entity.success_entity import SuccessEntity
    from entity.transaction_entity import TransactionEntity
    from entity.update_result_entity import UpdateResultEntity
    from entity.user_entity import UserEntity
