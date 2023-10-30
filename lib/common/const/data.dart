import 'dart:io';
import 'package:flutter/foundation.dart';


const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';
// const BASE_URL = 'http://192.168.0.241:3000';

// localhost
final realDeviceIp = '192.168.0.241:3000';

final emulatorIp = "http://10.0.2.2:3000/api";
final simulatorIp = 'http://127.0.0.1:3000/api';
final ip = kReleaseMode ? realDeviceIp : (Platform.isIOS ? simulatorIp : emulatorIp);
