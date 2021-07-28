unit Consts;

interface

const
  cLivePreviewServerManagerText = 'FireUI Live Preview Server';
  cLivePreviewServerProfileText = 'FireUI Live Preview Server Profile';
  cLivePreviewGroup = 'FireUILivePreview';
  cLivePreviewManagerClientText = 'FireUI Live Preview Client';
  cLivePreviewProfileClientText = 'FireUI Live Preview Client Profile';

  cTetServerIDIndex = 'TetServerID';

  cNonVisibleCommand = 'Visibility';
  cHideCommand = 'Hide';

  cFormStreamResourceName = 'FormStream';
  cDevicNameResourceName = 'DeviceName';
  cDeviceDescriptionResourceName = 'DeviceDescription';
  cDevicePlatformResourceName = 'DevicePlatform';
  cDeviceProtocolResourceName = 'Version';

  cDeviceProtocol = '1.00';

resourcestring
  sConnDetail = '%s at %s';
  sDiscoverTargetsAt = 'Discover Targets at';
  sAdvancedOptions = 'Advanced options';

  sServerNeedsAuth = 'Private Server';
  sPassword = #9'Password'; // First char below #30 will tell InputQuery to treat the box as a password

  sConnect = 'Connect';
  sDisconnect = 'Disconnect';
  sConnecting = 'Connecting...';
  sAuthenticating = 'Authenticating...';

  sAppName = 'FireUI App Preview';
  sAppVersion = 'v1.00';
  sAppNameFormat = '%s %s';

  sDiscoveringIP = 'Scaning %s';
  sDiscoveringNoIP = 'Scanning the local network';

  cCannotConnectTo = 'Cannot connect to ';
  cErrorGettingPowerService = 'Could not get Power Service';

implementation

end.
