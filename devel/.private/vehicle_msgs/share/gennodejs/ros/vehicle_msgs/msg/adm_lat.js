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

class adm_lat {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Enable_lat = null;
      this.GPS1_Curvature_cmd = null;
      this.V_des = null;
      this.Gear_des = null;
      this.End = null;
      this.Objectfalse = null;
      this.obs_dis = null;
      this.steering_wheel_angle = null;
      this.lateral_offset = null;
      this.current_ind = null;
    }
    else {
      if (initObj.hasOwnProperty('Enable_lat')) {
        this.Enable_lat = initObj.Enable_lat
      }
      else {
        this.Enable_lat = 0;
      }
      if (initObj.hasOwnProperty('GPS1_Curvature_cmd')) {
        this.GPS1_Curvature_cmd = initObj.GPS1_Curvature_cmd
      }
      else {
        this.GPS1_Curvature_cmd = 0.0;
      }
      if (initObj.hasOwnProperty('V_des')) {
        this.V_des = initObj.V_des
      }
      else {
        this.V_des = 0.0;
      }
      if (initObj.hasOwnProperty('Gear_des')) {
        this.Gear_des = initObj.Gear_des
      }
      else {
        this.Gear_des = 0;
      }
      if (initObj.hasOwnProperty('End')) {
        this.End = initObj.End
      }
      else {
        this.End = 0;
      }
      if (initObj.hasOwnProperty('Objectfalse')) {
        this.Objectfalse = initObj.Objectfalse
      }
      else {
        this.Objectfalse = 0;
      }
      if (initObj.hasOwnProperty('obs_dis')) {
        this.obs_dis = initObj.obs_dis
      }
      else {
        this.obs_dis = 0.0;
      }
      if (initObj.hasOwnProperty('steering_wheel_angle')) {
        this.steering_wheel_angle = initObj.steering_wheel_angle
      }
      else {
        this.steering_wheel_angle = 0.0;
      }
      if (initObj.hasOwnProperty('lateral_offset')) {
        this.lateral_offset = initObj.lateral_offset
      }
      else {
        this.lateral_offset = 0.0;
      }
      if (initObj.hasOwnProperty('current_ind')) {
        this.current_ind = initObj.current_ind
      }
      else {
        this.current_ind = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type adm_lat
    // Serialize message field [Enable_lat]
    bufferOffset = _serializer.uint8(obj.Enable_lat, buffer, bufferOffset);
    // Serialize message field [GPS1_Curvature_cmd]
    bufferOffset = _serializer.float32(obj.GPS1_Curvature_cmd, buffer, bufferOffset);
    // Serialize message field [V_des]
    bufferOffset = _serializer.float32(obj.V_des, buffer, bufferOffset);
    // Serialize message field [Gear_des]
    bufferOffset = _serializer.int8(obj.Gear_des, buffer, bufferOffset);
    // Serialize message field [End]
    bufferOffset = _serializer.uint8(obj.End, buffer, bufferOffset);
    // Serialize message field [Objectfalse]
    bufferOffset = _serializer.uint8(obj.Objectfalse, buffer, bufferOffset);
    // Serialize message field [obs_dis]
    bufferOffset = _serializer.float32(obj.obs_dis, buffer, bufferOffset);
    // Serialize message field [steering_wheel_angle]
    bufferOffset = _serializer.float32(obj.steering_wheel_angle, buffer, bufferOffset);
    // Serialize message field [lateral_offset]
    bufferOffset = _serializer.float32(obj.lateral_offset, buffer, bufferOffset);
    // Serialize message field [current_ind]
    bufferOffset = _serializer.int16(obj.current_ind, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type adm_lat
    let len;
    let data = new adm_lat(null);
    // Deserialize message field [Enable_lat]
    data.Enable_lat = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [GPS1_Curvature_cmd]
    data.GPS1_Curvature_cmd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [V_des]
    data.V_des = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Gear_des]
    data.Gear_des = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [End]
    data.End = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Objectfalse]
    data.Objectfalse = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [obs_dis]
    data.obs_dis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering_wheel_angle]
    data.steering_wheel_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateral_offset]
    data.lateral_offset = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_ind]
    data.current_ind = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/adm_lat';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '093d38f791b755925ba9f28e5792bd0c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 Enable_lat
    float32 GPS1_Curvature_cmd
    float32 V_des
    int8 Gear_des
    uint8 End
    uint8 Objectfalse
    float32 obs_dis
    float32 steering_wheel_angle
    float32 lateral_offset
    int16 current_ind
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new adm_lat(null);
    if (msg.Enable_lat !== undefined) {
      resolved.Enable_lat = msg.Enable_lat;
    }
    else {
      resolved.Enable_lat = 0
    }

    if (msg.GPS1_Curvature_cmd !== undefined) {
      resolved.GPS1_Curvature_cmd = msg.GPS1_Curvature_cmd;
    }
    else {
      resolved.GPS1_Curvature_cmd = 0.0
    }

    if (msg.V_des !== undefined) {
      resolved.V_des = msg.V_des;
    }
    else {
      resolved.V_des = 0.0
    }

    if (msg.Gear_des !== undefined) {
      resolved.Gear_des = msg.Gear_des;
    }
    else {
      resolved.Gear_des = 0
    }

    if (msg.End !== undefined) {
      resolved.End = msg.End;
    }
    else {
      resolved.End = 0
    }

    if (msg.Objectfalse !== undefined) {
      resolved.Objectfalse = msg.Objectfalse;
    }
    else {
      resolved.Objectfalse = 0
    }

    if (msg.obs_dis !== undefined) {
      resolved.obs_dis = msg.obs_dis;
    }
    else {
      resolved.obs_dis = 0.0
    }

    if (msg.steering_wheel_angle !== undefined) {
      resolved.steering_wheel_angle = msg.steering_wheel_angle;
    }
    else {
      resolved.steering_wheel_angle = 0.0
    }

    if (msg.lateral_offset !== undefined) {
      resolved.lateral_offset = msg.lateral_offset;
    }
    else {
      resolved.lateral_offset = 0.0
    }

    if (msg.current_ind !== undefined) {
      resolved.current_ind = msg.current_ind;
    }
    else {
      resolved.current_ind = 0
    }

    return resolved;
    }
};

module.exports = adm_lat;
