object LocationTrackingModule: TLocationTrackingModule
  OnCreate = AndroidServiceCreate
  OnBind = AndroidServiceBind
  OnUnBind = AndroidServiceUnBind
  OnRebind = AndroidServiceRebind
  OnStartCommand = AndroidServiceStartCommand
  Height = 238
  Width = 324
  object LocationSensor: TLocationSensor
    ActivityType = Other
    UsageAuthorization = WhenInUse
    OnLocationChanged = LocationSensorLocationChanged
    Left = 32
    Top = 8
  end
  object NotificationCenter: TNotificationCenter
    Left = 128
    Top = 8
  end
end
