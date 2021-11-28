
"use strict";

let adm_lat_last = require('./adm_lat_last.js');
let adm_cmd = require('./adm_cmd.js');
let vehicle_upload = require('./vehicle_upload.js');
let vehicle_status = require('./vehicle_status.js');
let adm_lat = require('./adm_lat.js');
let vehcile_cmd = require('./vehcile_cmd.js');
let vehicle_download = require('./vehicle_download.js');
let cdm_cmd = require('./cdm_cmd.js');
let dc = require('./dc.js');

module.exports = {
  adm_lat_last: adm_lat_last,
  adm_cmd: adm_cmd,
  vehicle_upload: vehicle_upload,
  vehicle_status: vehicle_status,
  adm_lat: adm_lat,
  vehcile_cmd: vehcile_cmd,
  vehicle_download: vehicle_download,
  cdm_cmd: cdm_cmd,
  dc: dc,
};
