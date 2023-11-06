import 'dart:io';
import 'package:flutter/foundation.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';
// const BASE_URL = 'http://192.168.0.241:3000';

// localhost
const realDeviceIp = 'http://221.163.19.218:33333/api';

const emulatorIp = "http://221.163.19.218:33333/api";
const simulatorIp = 'http://221.163.19.218:33333/api';
final ip =
    kReleaseMode ? realDeviceIp : (Platform.isIOS ? simulatorIp : emulatorIp);
