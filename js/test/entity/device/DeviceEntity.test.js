
const envlocal = __dirname + '/../../../.env.local'
require('../../utility').loadEnvLocal(envlocal)

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe, afterEach } = require('node:test')
const assert = require('node:assert')
const { createLiveTransport } = require('../../live-runner')
const { runLiveEntity } = require('../../live-entity')


const { BluefinDecryptxP2peSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  liveClientOptions,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('DeviceEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinDecryptxP2peSDK.test()
    const ent = testsdk.Device()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"activatedBy":{"a":true,"h":"Activated By","n":"activatedBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"activatedBy","index$":0},"activationDate":{"a":true,"fo":"datetime","h":"Activation Date","n":"activationDate","r":false,"sh":"Timestamp from when the Device was activated.","t":"`$STRING`","key$":"activationDate","index$":1},"alternateKey":{"a":true,"h":"Alternate Key","n":"alternateKey","r":false,"sh":"The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.","t":"`$STRING`","key$":"alternateKey","index$":2},"auditNextDate":{"a":true,"fo":"datetime","h":"Audit Next Date","n":"auditNextDate","r":false,"sh":"Date and time that the Device is due its next PCI Audit.","t":"`$STRING`","key$":"auditNextDate","index$":3},"auditNotificationDate":{"a":true,"fo":"datetime","h":"Audit Notification Date","n":"auditNotificationDate","r":false,"sh":"Date and time that a notification should be sent that a PCI audit is due.","t":"`$STRING`","key$":"auditNotificationDate","index$":4},"client":{"a":true,"h":"Client","n":"client","r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":5},"created":{"a":true,"fo":"datetime","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":6},"createdBy":{"a":true,"h":"Created By","n":"createdBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"createdBy","index$":7},"deviceBuild":{"a":true,"h":"Device Build","n":"deviceBuild","r":false,"sh":"Reference to the associated Device Build resource.","t":"`$OBJECT`","key$":"deviceBuild","index$":8},"deviceState":{"a":true,"h":"Device State","n":"deviceState","r":false,"sh":"Reference to the associated Device State resource.","t":"`$OBJECT`","key$":"deviceState","index$":9},"deviceType":{"a":true,"h":"Device Type","n":"deviceType","r":false,"sh":"Reference to the associated Device Type resource.","t":"`$OBJECT`","key$":"deviceType","index$":10},"errorCounter":{"a":true,"h":"Error Counter","n":"errorCounter","r":false,"sh":"The number times the Device has been in error.","t":"`$INTEGER`","key$":"errorCounter","index$":11},"errorLastDate":{"a":true,"fo":"datetime","h":"Error Last Date","n":"errorLastDate","r":false,"sh":"Timestamp from the last time that the Device had an error.","t":"`$STRING`","key$":"errorLastDate","index$":12},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"The Device's unique identifier.","t":"`$STRING`","key$":"id","index$":13},"initializedBy":{"a":true,"h":"Initialized By","n":"initializedBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"initializedBy","index$":14},"initializedDate":{"a":true,"fo":"datetime","h":"Initialized Date","n":"initializedDate","r":false,"sh":"Timestamp from when the Device was initialized.","t":"`$STRING`","key$":"initializedDate","index$":15},"injectKey":{"a":true,"h":"Inject Key","n":"injectKey","r":false,"sh":"Reference to the associated Device resource.","t":"`$OBJECT`","key$":"injectKey","index$":16},"isVirtual":{"a":true,"h":"Is Virtual","n":"isVirtual","r":false,"sh":"Indicates if a Device is Virtual (represents a Device shared with a partner).","t":"`$BOOLEAN`","key$":"isVirtual","index$":17},"kif":{"a":true,"h":"Kif","n":"kif","r":false,"sh":"Reference to the associated KIF resource.","t":"`$OBJECT`","key$":"kif","index$":18},"lastActivityDate":{"a":true,"fo":"datetime","h":"Last Activity Date","n":"lastActivityDate","r":false,"sh":"Timestamp from the last time that the Device was used.","t":"`$STRING`","key$":"lastActivityDate","index$":19},"location":{"a":true,"h":"Location","n":"location","r":true,"sh":"Reference to the associated Location resource.","t":"`$OBJECT`","key$":"location","index$":20},"modified":{"a":true,"fo":"datetime","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":21},"modifiedBy":{"a":true,"h":"Modified By","n":"modifiedBy","r":true,"sh":"Reference to the associated User resource.","t":"`$OBJECT`","key$":"modifiedBy","index$":22},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"The Device's name.","t":"`$STRING`","key$":"name","index$":23},"notes":{"a":true,"h":"Notes","n":"notes","r":false,"sh":"Arbitary note that can be attached to a Device entry.","t":"`$STRING`","key$":"notes","index$":24},"partner":{"a":true,"h":"Partner","n":"partner","r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"partner","index$":25},"serialNumber":{"a":true,"h":"Serial Number","n":"serialNumber","r":false,"sh":"The Device's serial number.","t":"`$STRING`","key$":"serialNumber","index$":26},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":27}},"id":{"field":"id","name":"id"},"name":"device","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /devices","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/devices","q":{},"r":{},"s":[{"lit":"devices"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /devices","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"client","or":"client","r":false,"t":"`$STRING`","index$":0},{"a":true,"k":"query","n":"device_state","or":"device_state","r":false,"t":"`$STRING`","index$":1},{"a":true,"k":"query","n":"kif","or":"kif","r":false,"t":"`$STRING`","index$":2},{"a":true,"k":"query","n":"partner","or":"partner","r":false,"t":"`$STRING`","index$":3},{"a":true,"k":"query","n":"serial_number","or":"serial_number","r":false,"t":"`$STRING`","index$":4},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":5},{"a":true,"ex":"asc","k":"query","n":"sorting_direction","or":"sorting_direction","r":false,"t":"`$STRING`","index$":6},{"a":true,"ex":"serialnumber","k":"query","n":"sorting_field","or":"sorting_field","r":false,"t":"`$STRING`","index$":7},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":8}]},"k":"http","m":"GET","o":"/devices","q":{"exist":["client","device_state","kif","partner","serial_number","skip","sorting_direction","sorting_field","take"]},"r":{},"s":[{"lit":"devices"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /devices/{serialNumber}/{deviceType}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"device_type","or":"device_type","r":true,"t":"`$STRING`","index$":0},{"a":true,"k":"param","n":"serial_number","or":"serial_number","r":true,"t":"`$STRING`","index$":1}]},"k":"http","m":"GET","o":"/devices/{serialNumber}/{deviceType}","q":{"exist":["device_type","serial_number"]},"r":{"param":{"deviceType":"device_type","serialNumber":"serial_number"}},"s":[{"lit":"devices"},{"var":"serial_number"},{"var":"device_type"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"GET /devices/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/devices/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"devices"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"device","name__orig":"device","Name":"Device","name_":"device","name-":"device","NAME":"DEVICE","index$":4}, {"active":true,"entity":"device","key$":"BasicDeviceFlow","kind":"basic","name":"BasicDeviceFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"device_ref01"},"m":{"serial_number":"serial_number01"},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"device_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"device_ref01","srcdatavar":"device_ref01_data","suffix":"_dt0"},"m":{"id":"device01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-device_ref01"}}],"index$":2}]}, 'Device', {"POST /devices":{"protocol":"http","requestBody":{"description":"Device to be created.","content":{"*/*":{"schema":{"required":["deviceType","kif","serialNumber"],"type":"object","properties":{"serialNumber":{"maxLength":255,"type":"string","description":"The Device's serial number.","example":"85000711"},"alternateKey":{"maxLength":255,"type":"string","description":"The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. If there is a difference between the two, the serial number on the casing or packaging should be used as the alternative key and also in the alterntive key property of any related Shipments entries.","example":"ID85000711"},"name":{"maxLength":255,"type":"string","description":"The Device's name.","example":"Atlanta Downtown Front Desk 1"},"deviceType":{"type":"object","properties":{"id":{"description":"The referenced Device Type's ID.","example":"23","type":"string"},"name":{"description":"The referenced Device Type's name.","example":"SREDKey","type":"string"}},"description":"Reference to the associated Device Type resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/DeviceTypeReference"},"deviceBuild":{"type":"object","properties":{"id":{"description":"The referenced Device Build's ID","example":"1305","type":"string"},"name":{"description":"The referenced Country's name.","example":"SREDKey 2 - PTS 5.X","type":"string"},"buildNumber":{"description":"The referenced Device's Build number.","example":"IDTECH-007","type":"string"}},"description":"Reference to the associated Device Build resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls the id, name and build number are included in the response.","x-ref":"#/components/schemas/DeviceBuildReference"},"kif":{"type":"object","properties":{"id":{"description":"The referenced KIF's ID.","example":"4","type":"string"},"name":{"description":"The referenced KIF's name.","example":"Kriptithe Technologies","type":"string"}},"description":"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/KifReference"},"partner":{"type":"object","properties":{"id":{"description":"The referenced Partner's ID.","example":"6580","type":"string"},"name":{"description":"The referenced Partner's name.","example":"ASM Software","type":"string"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference"},"client":{"type":"object","properties":{"id":{"description":"The referenced Client's ID.","example":"4684","type":"string"},"name":{"description":"The referenced Client's name.","example":"The Tired Window","type":"string"}},"description":"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/ClientReference"},"injectKey":{"type":"object","properties":{"id":{"maxLength":2,"type":"string","description":"The referenced Inject Key's ID.","example":"1"},"name":{"type":"string","description":"The referenced Inject Key's name.","example":"BPSDecrypt 8"}},"description":"Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are included in the response.","x-ref":"#/components/schemas/InjectKeyReference"},"auditNextDate":{"type":"string","description":"Date and time that the Device is due its next PCI Audit.","format":"datetime","example":"2017-05-08T20:14:45.000Z"},"notes":{"type":"string","description":"Arbitary note that can be attached to a Device entry.","example":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."}},"x-ref":"#/components/schemas/DeviceCreate"}}},"required":true},"parameters":[]},"GET /devices":{"protocol":"http","parameters":[{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","schema":{"type":"string"},"index$":0},{"name":"client","in":"query","description":"Filter the list by Client. The parameter value can be either a Client ID or Name.","schema":{"type":"string"},"index$":1},{"name":"kif","in":"query","description":"Filter the list by KIF. The parameter value can be either a KIF ID or Name.","schema":{"type":"string"},"index$":2},{"name":"serialNumber","in":"query","description":"Filter the list by a comma separated list of serial numbers.","schema":{"type":"string"},"index$":3},{"name":"deviceState","in":"query","description":"Filter the list by Device State.","schema":{"type":"string","enum":["new","injected","inTransit","damaged","retired","destroyed","tampered","malfunctioning","lost","stored","quarantined","doa","inRepair","tamperedP2PE","activating","activated","assigned","unassigned","rma"]},"index$":4},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":5},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":6},{"name":"sorting.field","in":"query","description":"The field to order the Device list.","schema":{"type":"string","default":"serialnumber","enum":["id","version","created","modified","serialnumber","alternatekey","name","devicetype","devicestate","location.id","location.name","activationdate","partner.id","partner.name","client.id","client.name","kif.id","kif.name"]},"index$":7},{"name":"sorting.direction","in":"query","description":"The direction to sort the Device list.","schema":{"type":"string","default":"asc","enum":["asc","desc"]},"index$":8}]},"GET /devices/{serialNumber}/{deviceType}":{"protocol":"http","parameters":[{"name":"serialNumber","in":"path","description":"The Device's unique identifier.","required":true,"schema":{"type":"string"},"index$":0},{"name":"deviceType","in":"path","description":"The Device Type Name. Note - this value must be URL encoded.","required":true,"schema":{"type":"string"},"index$":1}]},"GET /devices/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Device's unique identifier.","required":true,"schema":{"type":"string"},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const device_ref01_ent = client.Device()
    let device_ref01_data = setup.data.new.device['device_ref01']
    device_ref01_data['serial_number'] = setup.idmap['serial_number01']

    device_ref01_data = (await device_ref01_ent.create(device_ref01_data)).data()
    assert(null != device_ref01_data.id)


    // LIST
    const device_ref01_match = {}

    const device_ref01_list = (await device_ref01_ent.list(device_ref01_match)).map((e) => e.data())

    assert(!isempty(select(device_ref01_list, { id: device_ref01_data.id })))


    // LOAD
    const device_ref01_match_dt0 = {}
    device_ref01_match_dt0.id = device_ref01_data.id
    const device_ref01_data_dt0 = (await device_ref01_ent.load(device_ref01_match_dt0)).data()
    assert(device_ref01_data_dt0.id === device_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/device/DeviceTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BluefinDecryptxP2peSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['device01','device02','device03','serial_number01'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
  })

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID']

  const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new BluefinDecryptxP2peSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.BLUEFIN_DECRYPTX_P2PE_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when
      // the last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey and
      // server values above and handed the SDK undefined.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
