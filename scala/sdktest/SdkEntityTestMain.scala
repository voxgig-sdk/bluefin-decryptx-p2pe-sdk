// Aggregating entry point for the generated per-entity SDK tests. Drives
// every <Entity>EntityTest / <Entity>DirectTest object through one shared
// SdkTestReport and exits non-zero on any failure.
// Run: scala-cli run . --main-class SdkEntityTestMain

object SdkEntityTestMain {

  def main(args: Array[String]): Unit = {
    val rep = new SdkTestReport()

    AttestationEntityTest.run(rep)
    AttestationDirectTest.run(rep)
    ClientEntityTest.run(rep)
    ClientDirectTest.run(rep)
    CreateResultEntityTest.run(rep)
    DecryptionEntityTest.run(rep)
    DeviceEntityTest.run(rep)
    DeviceDirectTest.run(rep)
    DeviceBuildEntityTest.run(rep)
    DeviceBuildDirectTest.run(rep)
    DeviceCustodyDetailEntityTest.run(rep)
    DeviceCustodyDetailDirectTest.run(rep)
    DeviceCustodyListEntityTest.run(rep)
    DeviceCustodyListDirectTest.run(rep)
    DeviceListEntityTest.run(rep)
    DeviceListDirectTest.run(rep)
    DeviceReceiveResultEntityTest.run(rep)
    DeviceRkiActivateResultEntityTest.run(rep)
    DeviceStateEntityTest.run(rep)
    DeviceStateDirectTest.run(rep)
    DeviceTypeEntityTest.run(rep)
    DeviceTypeDirectTest.run(rep)
    InjectKeyEntityTest.run(rep)
    InjectKeyDirectTest.run(rep)
    KifEntityTest.run(rep)
    KifDirectTest.run(rep)
    LocationEntityTest.run(rep)
    LocationDirectTest.run(rep)
    PartnerEntityTest.run(rep)
    PartnerDirectTest.run(rep)
    ShipmentEntityTest.run(rep)
    ShipmentDirectTest.run(rep)
    SuccessEntityTest.run(rep)
    TransactionEntityTest.run(rep)
    TransactionDirectTest.run(rep)
    UpdateResultEntityTest.run(rep)
    UpdateResultDirectTest.run(rep)
    UserEntityTest.run(rep)
    UserDirectTest.run(rep)

    ReadmeExamplesTest.run(rep)

    rep.finish("ENTITY")
  }
}
