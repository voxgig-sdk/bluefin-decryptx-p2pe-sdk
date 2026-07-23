-- Generated model-driven entity + direct tests.
{-# LANGUAGE ScopedTypeVariables #-}

module SdkGenTests (genTests) where

import Control.Exception (SomeException, try)
import Data.IORef

import VoxgigStruct (Value (..), emptyMap, keysof, ismap, islist, isNoval, clone)
import SdkTypes
import SdkHelpers
import qualified SdkFeatures as F
import qualified SdkClient as C
import qualified TReadmeExamples
import Testutil
import TestJson (jsonRead)

-- Load an entity fixture (../.sdk/test/entity/<name>/<Name>TestData.json).
loadFixture :: String -> IO Value
loadFixture entName = do
  let lname = map toLowerCh entName
  raw <- readFile ("../.sdk/test/entity/" ++ lname ++ "/" ++ entName ++ "TestData.json")
  jsonRead raw
  where toLowerCh ch = if ch >= 'A' && ch <= 'Z' then toEnum (fromEnum ch + 32) else ch

-- The first new-ref data map for an entity (fixture.new.<entity>.<ref0>).
newRefData :: Value -> String -> IO Value
newRefData fixture entName = do
  newEnts <- getpathS fixture ("new." ++ entName)
  refs <- keysof newEnts
  case refs of
    [] -> emptyMap
    (r0 : _) -> do d <- getp newEnts r0; clone d

genTests :: Counters -> IO ()
genTests c = do
  TReadmeExamples.tests c
  attestationInstanceTest c
  attestationBasicTest c
  attestationDirectTest c
  attestationStreamTest c
  clientInstanceTest c
  clientBasicTest c
  clientDirectTest c
  clientStreamTest c
  create_resultInstanceTest c
  create_resultBasicTest c
  create_resultDirectTest c
  decryptionInstanceTest c
  decryptionBasicTest c
  decryptionDirectTest c
  deviceInstanceTest c
  deviceBasicTest c
  deviceDirectTest c
  deviceStreamTest c
  device_buildInstanceTest c
  device_buildBasicTest c
  device_buildDirectTest c
  device_buildStreamTest c
  device_custody_detailInstanceTest c
  device_custody_detailBasicTest c
  device_custody_detailDirectTest c
  device_custody_listInstanceTest c
  device_custody_listBasicTest c
  device_custody_listDirectTest c
  device_custody_listStreamTest c
  device_listInstanceTest c
  device_listBasicTest c
  device_listDirectTest c
  device_receive_resultInstanceTest c
  device_receive_resultBasicTest c
  device_receive_resultDirectTest c
  device_rki_activate_resultInstanceTest c
  device_rki_activate_resultBasicTest c
  device_rki_activate_resultDirectTest c
  device_stateInstanceTest c
  device_stateBasicTest c
  device_stateDirectTest c
  device_stateStreamTest c
  device_typeInstanceTest c
  device_typeBasicTest c
  device_typeDirectTest c
  device_typeStreamTest c
  inject_keyInstanceTest c
  inject_keyBasicTest c
  inject_keyDirectTest c
  inject_keyStreamTest c
  kifInstanceTest c
  kifBasicTest c
  kifDirectTest c
  kifStreamTest c
  locationInstanceTest c
  locationBasicTest c
  locationDirectTest c
  locationStreamTest c
  partnerInstanceTest c
  partnerBasicTest c
  partnerDirectTest c
  partnerStreamTest c
  shipmentInstanceTest c
  shipmentBasicTest c
  shipmentDirectTest c
  shipmentStreamTest c
  successInstanceTest c
  successBasicTest c
  successDirectTest c
  transactionInstanceTest c
  transactionBasicTest c
  transactionDirectTest c
  transactionStreamTest c
  update_resultInstanceTest c
  update_resultBasicTest c
  update_resultDirectTest c
  update_resultStreamTest c
  userInstanceTest c
  userBasicTest c
  userDirectTest c

attestationInstanceTest :: Counters -> IO ()
attestationInstanceTest c = runTest c "attestation.instance" $ do
  sdk <- C.testSdk0
  ent <- C.attestation sdk VNoval
  pure (eName ent == "attestation")

attestationBasicTest :: Counters -> IO ()
attestationBasicTest c = do
  fixture <- loadFixture "Attestation"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "attestation.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.attestation sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "attestation.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.attestation sdk VNoval
    entmap <- getp existing "attestation"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "attestation.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.attestation sdk VNoval
    d <- newRefData fixture "attestation"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

attestationDirectTest :: Counters -> IO ()
attestationDirectTest c = runTest c "attestation.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/attestation/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

attestationStreamTest :: Counters -> IO ()
attestationStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("attestation", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "attestation.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.attestation sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "attestation.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.attestation sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "attestation.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.attestation sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "attestation.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.attestation sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

clientInstanceTest :: Counters -> IO ()
clientInstanceTest c = runTest c "client.instance" $ do
  sdk <- C.testSdk0
  ent <- C.client sdk VNoval
  pure (eName ent == "client")

clientBasicTest :: Counters -> IO ()
clientBasicTest c = do
  fixture <- loadFixture "Client"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "client.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "client.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    entmap <- getp existing "client"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "client.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    d <- newRefData fixture "client"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "client.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    d <- newRefData fixture "client"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

clientDirectTest :: Counters -> IO ()
clientDirectTest c = runTest c "client.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/client/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

clientStreamTest :: Counters -> IO ()
clientStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("client", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "client.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "client.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.client sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "client.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.client sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "client.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.client sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

create_resultInstanceTest :: Counters -> IO ()
create_resultInstanceTest c = runTest c "create_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.create_result sdk VNoval
  pure (eName ent == "create_result")

create_resultBasicTest :: Counters -> IO ()
create_resultBasicTest c = do
  fixture <- loadFixture "CreateResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "create_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.create_result sdk VNoval
    d <- newRefData fixture "create_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

create_resultDirectTest :: Counters -> IO ()
create_resultDirectTest c = runTest c "create_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/create_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

decryptionInstanceTest :: Counters -> IO ()
decryptionInstanceTest c = runTest c "decryption.instance" $ do
  sdk <- C.testSdk0
  ent <- C.decryption sdk VNoval
  pure (eName ent == "decryption")

decryptionBasicTest :: Counters -> IO ()
decryptionBasicTest c = do
  fixture <- loadFixture "Decryption"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "decryption.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.decryption sdk VNoval
    d <- newRefData fixture "decryption"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

decryptionDirectTest :: Counters -> IO ()
decryptionDirectTest c = runTest c "decryption.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/decryption/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

deviceInstanceTest :: Counters -> IO ()
deviceInstanceTest c = runTest c "device.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device sdk VNoval
  pure (eName ent == "device")

deviceBasicTest :: Counters -> IO ()
deviceBasicTest c = do
  fixture <- loadFixture "Device"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "device.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device sdk VNoval
    entmap <- getp existing "device"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "device.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device sdk VNoval
    d <- newRefData fixture "device"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

deviceDirectTest :: Counters -> IO ()
deviceDirectTest c = runTest c "device.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

deviceStreamTest :: Counters -> IO ()
deviceStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("device", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "device.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "device.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "device.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "device.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

device_buildInstanceTest :: Counters -> IO ()
device_buildInstanceTest c = runTest c "device_build.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_build sdk VNoval
  pure (eName ent == "device_build")

device_buildBasicTest :: Counters -> IO ()
device_buildBasicTest c = do
  fixture <- loadFixture "DeviceBuild"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_build.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_build sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "device_build.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_build sdk VNoval
    entmap <- getp existing "device_build"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

device_buildDirectTest :: Counters -> IO ()
device_buildDirectTest c = runTest c "device_build.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_build/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_buildStreamTest :: Counters -> IO ()
device_buildStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("device_build", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "device_build.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_build sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "device_build.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_build sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "device_build.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_build sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "device_build.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_build sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

device_custody_detailInstanceTest :: Counters -> IO ()
device_custody_detailInstanceTest c = runTest c "device_custody_detail.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_custody_detail sdk VNoval
  pure (eName ent == "device_custody_detail")

device_custody_detailBasicTest :: Counters -> IO ()
device_custody_detailBasicTest c = do
  fixture <- loadFixture "DeviceCustodyDetail"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_custody_detail.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_custody_detail sdk VNoval
    entmap <- getp existing "device_custody_detail"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

device_custody_detailDirectTest :: Counters -> IO ()
device_custody_detailDirectTest c = runTest c "device_custody_detail.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_custody_detail/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_custody_listInstanceTest :: Counters -> IO ()
device_custody_listInstanceTest c = runTest c "device_custody_list.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_custody_list sdk VNoval
  pure (eName ent == "device_custody_list")

device_custody_listBasicTest :: Counters -> IO ()
device_custody_listBasicTest c = do
  fixture <- loadFixture "DeviceCustodyList"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_custody_list.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_custody_list sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)

device_custody_listDirectTest :: Counters -> IO ()
device_custody_listDirectTest c = runTest c "device_custody_list.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_custody_list/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_custody_listStreamTest :: Counters -> IO ()
device_custody_listStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("device_custody_list", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "device_custody_list.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_custody_list sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "device_custody_list.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_custody_list sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "device_custody_list.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_custody_list sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "device_custody_list.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_custody_list sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

device_listInstanceTest :: Counters -> IO ()
device_listInstanceTest c = runTest c "device_list.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_list sdk VNoval
  pure (eName ent == "device_list")

device_listBasicTest :: Counters -> IO ()
device_listBasicTest c = do
  fixture <- loadFixture "DeviceList"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_list.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_list sdk VNoval
    entmap <- getp existing "device_list"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

device_listDirectTest :: Counters -> IO ()
device_listDirectTest c = runTest c "device_list.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_list/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_receive_resultInstanceTest :: Counters -> IO ()
device_receive_resultInstanceTest c = runTest c "device_receive_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_receive_result sdk VNoval
  pure (eName ent == "device_receive_result")

device_receive_resultBasicTest :: Counters -> IO ()
device_receive_resultBasicTest c = do
  fixture <- loadFixture "DeviceReceiveResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_receive_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_receive_result sdk VNoval
    d <- newRefData fixture "device_receive_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

device_receive_resultDirectTest :: Counters -> IO ()
device_receive_resultDirectTest c = runTest c "device_receive_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_receive_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_rki_activate_resultInstanceTest :: Counters -> IO ()
device_rki_activate_resultInstanceTest c = runTest c "device_rki_activate_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_rki_activate_result sdk VNoval
  pure (eName ent == "device_rki_activate_result")

device_rki_activate_resultBasicTest :: Counters -> IO ()
device_rki_activate_resultBasicTest c = do
  fixture <- loadFixture "DeviceRkiActivateResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_rki_activate_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_rki_activate_result sdk VNoval
    d <- newRefData fixture "device_rki_activate_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

device_rki_activate_resultDirectTest :: Counters -> IO ()
device_rki_activate_resultDirectTest c = runTest c "device_rki_activate_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_rki_activate_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_stateInstanceTest :: Counters -> IO ()
device_stateInstanceTest c = runTest c "device_state.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_state sdk VNoval
  pure (eName ent == "device_state")

device_stateBasicTest :: Counters -> IO ()
device_stateBasicTest c = do
  fixture <- loadFixture "DeviceState"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_state.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_state sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)

device_stateDirectTest :: Counters -> IO ()
device_stateDirectTest c = runTest c "device_state.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_state/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_stateStreamTest :: Counters -> IO ()
device_stateStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("device_state", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "device_state.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_state sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "device_state.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_state sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "device_state.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_state sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "device_state.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_state sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

device_typeInstanceTest :: Counters -> IO ()
device_typeInstanceTest c = runTest c "device_type.instance" $ do
  sdk <- C.testSdk0
  ent <- C.device_type sdk VNoval
  pure (eName ent == "device_type")

device_typeBasicTest :: Counters -> IO ()
device_typeBasicTest c = do
  fixture <- loadFixture "DeviceType"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "device_type.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_type sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "device_type.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.device_type sdk VNoval
    entmap <- getp existing "device_type"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

device_typeDirectTest :: Counters -> IO ()
device_typeDirectTest c = runTest c "device_type.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/device_type/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

device_typeStreamTest :: Counters -> IO ()
device_typeStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("device_type", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "device_type.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_type sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "device_type.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.device_type sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "device_type.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_type sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "device_type.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.device_type sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

inject_keyInstanceTest :: Counters -> IO ()
inject_keyInstanceTest c = runTest c "inject_key.instance" $ do
  sdk <- C.testSdk0
  ent <- C.inject_key sdk VNoval
  pure (eName ent == "inject_key")

inject_keyBasicTest :: Counters -> IO ()
inject_keyBasicTest c = do
  fixture <- loadFixture "InjectKey"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "inject_key.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.inject_key sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "inject_key.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.inject_key sdk VNoval
    entmap <- getp existing "inject_key"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

inject_keyDirectTest :: Counters -> IO ()
inject_keyDirectTest c = runTest c "inject_key.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/inject_key/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

inject_keyStreamTest :: Counters -> IO ()
inject_keyStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("inject_key", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "inject_key.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.inject_key sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "inject_key.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.inject_key sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "inject_key.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.inject_key sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "inject_key.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.inject_key sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

kifInstanceTest :: Counters -> IO ()
kifInstanceTest c = runTest c "kif.instance" $ do
  sdk <- C.testSdk0
  ent <- C.kif sdk VNoval
  pure (eName ent == "kif")

kifBasicTest :: Counters -> IO ()
kifBasicTest c = do
  fixture <- loadFixture "Kif"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "kif.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.kif sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)

kifDirectTest :: Counters -> IO ()
kifDirectTest c = runTest c "kif.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/kif/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

kifStreamTest :: Counters -> IO ()
kifStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("kif", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "kif.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.kif sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "kif.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.kif sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "kif.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.kif sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "kif.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.kif sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

locationInstanceTest :: Counters -> IO ()
locationInstanceTest c = runTest c "location.instance" $ do
  sdk <- C.testSdk0
  ent <- C.location sdk VNoval
  pure (eName ent == "location")

locationBasicTest :: Counters -> IO ()
locationBasicTest c = do
  fixture <- loadFixture "Location"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "location.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.location sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "location.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.location sdk VNoval
    entmap <- getp existing "location"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "location.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.location sdk VNoval
    d <- newRefData fixture "location"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "location.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.location sdk VNoval
    d <- newRefData fixture "location"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

locationDirectTest :: Counters -> IO ()
locationDirectTest c = runTest c "location.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/location/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

locationStreamTest :: Counters -> IO ()
locationStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("location", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "location.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.location sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "location.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.location sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "location.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.location sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "location.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.location sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

partnerInstanceTest :: Counters -> IO ()
partnerInstanceTest c = runTest c "partner.instance" $ do
  sdk <- C.testSdk0
  ent <- C.partner sdk VNoval
  pure (eName ent == "partner")

partnerBasicTest :: Counters -> IO ()
partnerBasicTest c = do
  fixture <- loadFixture "Partner"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "partner.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "partner.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    entmap <- getp existing "partner"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "partner.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    d <- newRefData fixture "partner"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

partnerDirectTest :: Counters -> IO ()
partnerDirectTest c = runTest c "partner.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/partner/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

partnerStreamTest :: Counters -> IO ()
partnerStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("partner", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "partner.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "partner.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.partner sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "partner.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.partner sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "partner.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.partner sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

shipmentInstanceTest :: Counters -> IO ()
shipmentInstanceTest c = runTest c "shipment.instance" $ do
  sdk <- C.testSdk0
  ent <- C.shipment sdk VNoval
  pure (eName ent == "shipment")

shipmentBasicTest :: Counters -> IO ()
shipmentBasicTest c = do
  fixture <- loadFixture "Shipment"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "shipment.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.shipment sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "shipment.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.shipment sdk VNoval
    entmap <- getp existing "shipment"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "shipment.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.shipment sdk VNoval
    d <- newRefData fixture "shipment"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

shipmentDirectTest :: Counters -> IO ()
shipmentDirectTest c = runTest c "shipment.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/shipment/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

shipmentStreamTest :: Counters -> IO ()
shipmentStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("shipment", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "shipment.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.shipment sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "shipment.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.shipment sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "shipment.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.shipment sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "shipment.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.shipment sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

successInstanceTest :: Counters -> IO ()
successInstanceTest c = runTest c "success.instance" $ do
  sdk <- C.testSdk0
  ent <- C.success sdk VNoval
  pure (eName ent == "success")

successBasicTest :: Counters -> IO ()
successBasicTest c = do
  fixture <- loadFixture "Success"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "success.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.success sdk VNoval
    d <- newRefData fixture "success"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "success.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.success sdk VNoval
    d <- newRefData fixture "success"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

successDirectTest :: Counters -> IO ()
successDirectTest c = runTest c "success.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/success/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

transactionInstanceTest :: Counters -> IO ()
transactionInstanceTest c = runTest c "transaction.instance" $ do
  sdk <- C.testSdk0
  ent <- C.transaction sdk VNoval
  pure (eName ent == "transaction")

transactionBasicTest :: Counters -> IO ()
transactionBasicTest c = do
  fixture <- loadFixture "Transaction"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "transaction.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "transaction.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    entmap <- getp existing "transaction"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "transaction.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    d <- newRefData fixture "transaction"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

transactionDirectTest :: Counters -> IO ()
transactionDirectTest c = runTest c "transaction.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/transaction/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

transactionStreamTest :: Counters -> IO ()
transactionStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("transaction", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "transaction.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "transaction.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "transaction.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.transaction sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "transaction.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.transaction sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

update_resultInstanceTest :: Counters -> IO ()
update_resultInstanceTest c = runTest c "update_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.update_result sdk VNoval
  pure (eName ent == "update_result")

update_resultBasicTest :: Counters -> IO ()
update_resultBasicTest c = do
  fixture <- loadFixture "UpdateResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "update_result.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "update_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    d <- newRefData fixture "update_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "update_result.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    d <- newRefData fixture "update_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")

update_resultDirectTest :: Counters -> IO ()
update_resultDirectTest c = runTest c "update_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/update_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

update_resultStreamTest :: Counters -> IO ()
update_resultStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("update_result", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "update_result.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "update_result.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.update_result sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "update_result.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.update_result sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "update_result.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.update_result sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

userInstanceTest :: Counters -> IO ()
userInstanceTest c = runTest c "user.instance" $ do
  sdk <- C.testSdk0
  ent <- C.user sdk VNoval
  pure (eName ent == "user")

userBasicTest :: Counters -> IO ()
userBasicTest c = do
  fixture <- loadFixture "User"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "user.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.user sdk VNoval
    entmap <- getp existing "user"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

userDirectTest :: Counters -> IO ()
userDirectTest c = runTest c "user.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/user/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)
