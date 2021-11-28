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

class vehicle_upload {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Vehicle_speed = null;
      this.Vehicle_speedQuality = null;
      this.EPS_SteerAng = null;
      this.EPS_SteerAngQuality = null;
      this.BMS_BattSOC = null;
      this.BMS_BattSOCQuality = null;
      this.Tar_gearFeed = null;
      this.Tar_gearFeedQuality = null;
      this.Drive_Mode = null;
    }
    else {
      if (initObj.hasOwnProperty('Vehicle_speed')) {
        this.Vehicle_speed = initObj.Vehicle_speed
      }
      else {
        this.Vehicle_speed = 0.0;
      }
      if (initObj.hasOwnProperty('Vehicle_speedQuality')) {
        this.Vehicle_speedQuality = initObj.Vehicle_speedQuality
      }
      else {
        this.Vehicle_speedQuality = 0.0;
      }
      if (initObj.hasOwnProperty('EPS_SteerAng')) {
        this.EPS_SteerAng = initObj.EPS_SteerAng
      }
      else {
        this.EPS_SteerAng = 0.0;
      }
      if (initObj.hasOwnProperty('EPS_SteerAngQuality')) {
        this.EPS_SteerAngQuality = initObj.EPS_SteerAngQuality
      }
      else {
        this.EPS_SteerAngQuality = 0.0;
      }
      if (initObj.hasOwnProperty('BMS_BattSOC')) {
        this.BMS_BattSOC = initObj.BMS_BattSOC
      }
      else {
        this.BMS_BattSOC = 0.0;
      }
      if (initObj.hasOwnProperty('BMS_BattSOCQuality')) {
        this.BMS_BattSOCQuality = initObj.BMS_BattSOCQuality
      }
      else {
        this.BMS_BattSOCQuality = 0.0;
      }
      if (initObj.hasOwnProperty('Tar_gearFeed')) {
        this.Tar_gearFeed = initObj.Tar_gearFeed
      }
      else {
        this.Tar_gearFeed = 0;
      }
      if (initObj.hasOwnProperty('Tar_gearFeedQuality')) {
        this.Tar_gearFeedQuality = initObj.Tar_gearFeedQuality
      }
      else {
        this.Tar_gearFeedQuality = 0;
      }
      if (initObj.hasOwnProperty('Drive_Mode')) {
        this.Drive_Mode = initObj.Drive_Mode
      }
      else {
        this.Drive_Mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vehicle_upload
    // Serialize message field [Vehicle_speed]
    bufferOffset = _serializer.float32(obj.Vehicle_speed, buffer, bufferOffset);
    // Serialize message field [Vehicle_speedQuality]
    bufferOffset = _serializer.float32(obj.Vehicle_speedQuality, buffer, bufferOffset);
    // Serialize message field [EPS_SteerAng]
    bufferOffset = _serializer.float32(obj.EPS_SteerAng, buffer, bufferOffset);
    // Serialize message field [EPS_SteerAngQuality]
    bufferOffset = _serializer.float32(obj.EPS_SteerAngQuality, buffer, bufferOffset);
    // Serialize message field [BMS_BattSOC]
    bufferOffset = _serializer.float32(obj.BMS_BattSOC, buffer, bufferOffset);
    // Serialize message field [BMS_BattSOCQuality]
    bufferOffset = _serializer.float32(obj.BMS_BattSOCQuality, buffer, bufferOffset);
    // Serialize message field [Tar_gearFeed]
    bufferOffset = _serializer.uint8(obj.Tar_gearFeed, buffer, bufferOffset);
    // Serialize message field [Tar_gearFeedQuality]
    bufferOffset = _serializer.uint8(obj.Tar_gearFeedQuality, buffer, bufferOffset);
    // Serialize message field [Drive_Mode]
    bufferOffset = _serializer.uint8(obj.Drive_Mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vehicle_upload
    let len;
    let data = new vehicle_upload(null);
    // Deserialize message field [Vehicle_speed]
    data.Vehicle_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Vehicle_speedQuality]
    data.Vehicle_speedQuality = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [EPS_SteerAng]
    data.EPS_SteerAng = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [EPS_SteerAngQuality]
    data.EPS_SteerAngQuality = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BMS_BattSOC]
    data.BMS_BattSOC = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BMS_BattSOCQuality]
    data.BMS_BattSOCQuality = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Tar_gearFeed]
    data.Tar_gearFeed = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Tar_gearFeedQuality]
    data.Tar_gearFeedQuality = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Drive_Mode]
    data.Drive_Mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 27;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/vehicle_upload';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dd7e7d66aa61f766087ccedcc5b96655';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Vehicle_speed
    float32 Vehicle_speedQuality
    float32 EPS_SteerAng
    float32 EPS_SteerAngQuality
    float32 BMS_BattSOC
    float32 BMS_BattSOCQuality
    uint8 Tar_gearFeed
    uint8 Tar_gearFeedQuality
    uint8 Drive_Mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vehicle_upload(null);
    if (msg.Vehicle_speed !== undefined) {
      resolved.Vehicle_speed = msg.Vehicle_speed;
    }
    else {
      resolved.Vehicle_speed = 0.0
    }

    if (msg.Vehicle_speedQuality !== undefined) {
      resolved.Vehicle_speedQuality = msg.Vehicle_speedQuality;
    }
    else {
      resolved.Vehicle_speedQuality = 0.0
    }

    if (msg.EPS_SteerAng !== undefined) {
      resolved.EPS_SteerAng = msg.EPS_SteerAng;
    }
    else {
      resolved.EPS_SteerAng = 0.0
    }

    if (msg.EPS_SteerAngQuality !== undefined) {
      resolved.EPS_SteerAngQuality = msg.EPS_SteerAngQuality;
    }
    else {
      resolved.EPS_SteerAngQuality = 0.0
    }

    if (msg.BMS_BattSOC !== undefined) {
      resolved.BMS_BattSOC = msg.BMS_BattSOC;
    }
    else {
      resolved.BMS_BattSOC = 0.0
    }

    if (msg.BMS_BattSOCQuality !== undefined) {
      resolved.BMS_BattSOCQuality = msg.BMS_BattSOCQuality;
    }
    else {
      resolved.BMS_BattSOCQuality = 0.0
    }

    if (msg.Tar_gearFeed !== undefined) {
      resolved.Tar_gearFeed = msg.Tar_gearFeed;
    }
    else {
      resolved.Tar_gearFeed = 0
    }

    if (msg.Tar_gearFeedQuality !== undefined) {
      resolved.Tar_gearFeedQuality = msg.Tar_gearFeedQuality;
    }
    else {
      resolved.Tar_gearFeedQuality = 0
    }

    if (msg.Drive_Mode !== undefined) {
      resolved.Drive_Mode = msg.Drive_Mode;
    }
    else {
      resolved.Drive_Mode = 0
    }

    return resolved;
    }
};

module.exports = vehicle_upload;
