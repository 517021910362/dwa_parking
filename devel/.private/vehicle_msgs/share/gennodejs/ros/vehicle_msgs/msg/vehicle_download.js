// Auto-generated. Do not edit!

// (in-package vehicle_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class vehicle_download {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.TarAccler = null;
      this.Tar_steerangle = null;
      this.Tar_gear = null;
      this.DiveoffReq = null;
      this.ADS_mode = null;
      this.Stoprequest = null;
      this.EndOfTravel = null;
      this.Station_In_Out = null;
      this.TurnSignal = null;
      this.DoubleLight = null;
      this.HummerSts = null;
      this.latAcceleration = null;
      this.longAcceleration = null;
      this.Acceleration = null;
      this.Yaw_rate = null;
      this.Slope = null;
    }
    else {
      if (initObj.hasOwnProperty('TarAccler')) {
        this.TarAccler = initObj.TarAccler
      }
      else {
        this.TarAccler = 0.0;
      }
      if (initObj.hasOwnProperty('Tar_steerangle')) {
        this.Tar_steerangle = initObj.Tar_steerangle
      }
      else {
        this.Tar_steerangle = 0.0;
      }
      if (initObj.hasOwnProperty('Tar_gear')) {
        this.Tar_gear = initObj.Tar_gear
      }
      else {
        this.Tar_gear = 0;
      }
      if (initObj.hasOwnProperty('DiveoffReq')) {
        this.DiveoffReq = initObj.DiveoffReq
      }
      else {
        this.DiveoffReq = 0;
      }
      if (initObj.hasOwnProperty('ADS_mode')) {
        this.ADS_mode = initObj.ADS_mode
      }
      else {
        this.ADS_mode = 0;
      }
      if (initObj.hasOwnProperty('Stoprequest')) {
        this.Stoprequest = initObj.Stoprequest
      }
      else {
        this.Stoprequest = 0;
      }
      if (initObj.hasOwnProperty('EndOfTravel')) {
        this.EndOfTravel = initObj.EndOfTravel
      }
      else {
        this.EndOfTravel = 0;
      }
      if (initObj.hasOwnProperty('Station_In_Out')) {
        this.Station_In_Out = initObj.Station_In_Out
      }
      else {
        this.Station_In_Out = 0;
      }
      if (initObj.hasOwnProperty('TurnSignal')) {
        this.TurnSignal = initObj.TurnSignal
      }
      else {
        this.TurnSignal = 0;
      }
      if (initObj.hasOwnProperty('DoubleLight')) {
        this.DoubleLight = initObj.DoubleLight
      }
      else {
        this.DoubleLight = 0;
      }
      if (initObj.hasOwnProperty('HummerSts')) {
        this.HummerSts = initObj.HummerSts
      }
      else {
        this.HummerSts = 0;
      }
      if (initObj.hasOwnProperty('latAcceleration')) {
        this.latAcceleration = initObj.latAcceleration
      }
      else {
        this.latAcceleration = 0.0;
      }
      if (initObj.hasOwnProperty('longAcceleration')) {
        this.longAcceleration = initObj.longAcceleration
      }
      else {
        this.longAcceleration = 0.0;
      }
      if (initObj.hasOwnProperty('Acceleration')) {
        this.Acceleration = initObj.Acceleration
      }
      else {
        this.Acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('Yaw_rate')) {
        this.Yaw_rate = initObj.Yaw_rate
      }
      else {
        this.Yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('Slope')) {
        this.Slope = initObj.Slope
      }
      else {
        this.Slope = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vehicle_download
    // Serialize message field [TarAccler]
    bufferOffset = _serializer.float32(obj.TarAccler, buffer, bufferOffset);
    // Serialize message field [Tar_steerangle]
    bufferOffset = _serializer.float32(obj.Tar_steerangle, buffer, bufferOffset);
    // Serialize message field [Tar_gear]
    bufferOffset = _serializer.uint8(obj.Tar_gear, buffer, bufferOffset);
    // Serialize message field [DiveoffReq]
    bufferOffset = _serializer.uint8(obj.DiveoffReq, buffer, bufferOffset);
    // Serialize message field [ADS_mode]
    bufferOffset = _serializer.uint8(obj.ADS_mode, buffer, bufferOffset);
    // Serialize message field [Stoprequest]
    bufferOffset = _serializer.uint8(obj.Stoprequest, buffer, bufferOffset);
    // Serialize message field [EndOfTravel]
    bufferOffset = _serializer.uint8(obj.EndOfTravel, buffer, bufferOffset);
    // Serialize message field [Station_In_Out]
    bufferOffset = _serializer.uint8(obj.Station_In_Out, buffer, bufferOffset);
    // Serialize message field [TurnSignal]
    bufferOffset = _serializer.uint8(obj.TurnSignal, buffer, bufferOffset);
    // Serialize message field [DoubleLight]
    bufferOffset = _serializer.uint8(obj.DoubleLight, buffer, bufferOffset);
    // Serialize message field [HummerSts]
    bufferOffset = _serializer.uint8(obj.HummerSts, buffer, bufferOffset);
    // Serialize message field [latAcceleration]
    bufferOffset = _serializer.float32(obj.latAcceleration, buffer, bufferOffset);
    // Serialize message field [longAcceleration]
    bufferOffset = _serializer.float32(obj.longAcceleration, buffer, bufferOffset);
    // Serialize message field [Acceleration]
    bufferOffset = _serializer.float32(obj.Acceleration, buffer, bufferOffset);
    // Serialize message field [Yaw_rate]
    bufferOffset = _serializer.float32(obj.Yaw_rate, buffer, bufferOffset);
    // Serialize message field [Slope]
    bufferOffset = _serializer.float32(obj.Slope, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vehicle_download
    let len;
    let data = new vehicle_download(null);
    // Deserialize message field [TarAccler]
    data.TarAccler = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Tar_steerangle]
    data.Tar_steerangle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Tar_gear]
    data.Tar_gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DiveoffReq]
    data.DiveoffReq = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ADS_mode]
    data.ADS_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Stoprequest]
    data.Stoprequest = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [EndOfTravel]
    data.EndOfTravel = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Station_In_Out]
    data.Station_In_Out = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [TurnSignal]
    data.TurnSignal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DoubleLight]
    data.DoubleLight = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [HummerSts]
    data.HummerSts = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [latAcceleration]
    data.latAcceleration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [longAcceleration]
    data.longAcceleration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Acceleration]
    data.Acceleration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Yaw_rate]
    data.Yaw_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Slope]
    data.Slope = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/vehicle_download';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b1c7accc64c1d758d5af51e3905238ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 TarAccler
    float32 Tar_steerangle
    uint8 Tar_gear
    uint8 DiveoffReq
    uint8 ADS_mode
    uint8 Stoprequest
    uint8 EndOfTravel
    uint8 Station_In_Out
    uint8 TurnSignal
    uint8 DoubleLight
    uint8 HummerSts
    float32 latAcceleration
    float32 longAcceleration
    float32 Acceleration
    float32 Yaw_rate
    float32 Slope
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vehicle_download(null);
    if (msg.TarAccler !== undefined) {
      resolved.TarAccler = msg.TarAccler;
    }
    else {
      resolved.TarAccler = 0.0
    }

    if (msg.Tar_steerangle !== undefined) {
      resolved.Tar_steerangle = msg.Tar_steerangle;
    }
    else {
      resolved.Tar_steerangle = 0.0
    }

    if (msg.Tar_gear !== undefined) {
      resolved.Tar_gear = msg.Tar_gear;
    }
    else {
      resolved.Tar_gear = 0
    }

    if (msg.DiveoffReq !== undefined) {
      resolved.DiveoffReq = msg.DiveoffReq;
    }
    else {
      resolved.DiveoffReq = 0
    }

    if (msg.ADS_mode !== undefined) {
      resolved.ADS_mode = msg.ADS_mode;
    }
    else {
      resolved.ADS_mode = 0
    }

    if (msg.Stoprequest !== undefined) {
      resolved.Stoprequest = msg.Stoprequest;
    }
    else {
      resolved.Stoprequest = 0
    }

    if (msg.EndOfTravel !== undefined) {
      resolved.EndOfTravel = msg.EndOfTravel;
    }
    else {
      resolved.EndOfTravel = 0
    }

    if (msg.Station_In_Out !== undefined) {
      resolved.Station_In_Out = msg.Station_In_Out;
    }
    else {
      resolved.Station_In_Out = 0
    }

    if (msg.TurnSignal !== undefined) {
      resolved.TurnSignal = msg.TurnSignal;
    }
    else {
      resolved.TurnSignal = 0
    }

    if (msg.DoubleLight !== undefined) {
      resolved.DoubleLight = msg.DoubleLight;
    }
    else {
      resolved.DoubleLight = 0
    }

    if (msg.HummerSts !== undefined) {
      resolved.HummerSts = msg.HummerSts;
    }
    else {
      resolved.HummerSts = 0
    }

    if (msg.latAcceleration !== undefined) {
      resolved.latAcceleration = msg.latAcceleration;
    }
    else {
      resolved.latAcceleration = 0.0
    }

    if (msg.longAcceleration !== undefined) {
      resolved.longAcceleration = msg.longAcceleration;
    }
    else {
      resolved.longAcceleration = 0.0
    }

    if (msg.Acceleration !== undefined) {
      resolved.Acceleration = msg.Acceleration;
    }
    else {
      resolved.Acceleration = 0.0
    }

    if (msg.Yaw_rate !== undefined) {
      resolved.Yaw_rate = msg.Yaw_rate;
    }
    else {
      resolved.Yaw_rate = 0.0
    }

    if (msg.Slope !== undefined) {
      resolved.Slope = msg.Slope;
    }
    else {
      resolved.Slope = 0.0
    }

    return resolved;
    }
};

module.exports = vehicle_download;
