// Auto-generated. Do not edit!

// (in-package common_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Range3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xMax = null;
      this.xMin = null;
      this.yMax = null;
      this.yMin = null;
      this.zMax = null;
      this.zMin = null;
    }
    else {
      if (initObj.hasOwnProperty('xMax')) {
        this.xMax = initObj.xMax
      }
      else {
        this.xMax = 0.0;
      }
      if (initObj.hasOwnProperty('xMin')) {
        this.xMin = initObj.xMin
      }
      else {
        this.xMin = 0.0;
      }
      if (initObj.hasOwnProperty('yMax')) {
        this.yMax = initObj.yMax
      }
      else {
        this.yMax = 0.0;
      }
      if (initObj.hasOwnProperty('yMin')) {
        this.yMin = initObj.yMin
      }
      else {
        this.yMin = 0.0;
      }
      if (initObj.hasOwnProperty('zMax')) {
        this.zMax = initObj.zMax
      }
      else {
        this.zMax = 0.0;
      }
      if (initObj.hasOwnProperty('zMin')) {
        this.zMin = initObj.zMin
      }
      else {
        this.zMin = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Range3D
    // Serialize message field [xMax]
    bufferOffset = _serializer.float32(obj.xMax, buffer, bufferOffset);
    // Serialize message field [xMin]
    bufferOffset = _serializer.float32(obj.xMin, buffer, bufferOffset);
    // Serialize message field [yMax]
    bufferOffset = _serializer.float32(obj.yMax, buffer, bufferOffset);
    // Serialize message field [yMin]
    bufferOffset = _serializer.float32(obj.yMin, buffer, bufferOffset);
    // Serialize message field [zMax]
    bufferOffset = _serializer.float32(obj.zMax, buffer, bufferOffset);
    // Serialize message field [zMin]
    bufferOffset = _serializer.float32(obj.zMin, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Range3D
    let len;
    let data = new Range3D(null);
    // Deserialize message field [xMax]
    data.xMax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [xMin]
    data.xMin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yMax]
    data.yMax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yMin]
    data.yMin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zMax]
    data.zMax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zMin]
    data.zMin = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common_msgs/Range3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '440fcab4969f9ce8d62e2fe8adcf659a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 xMax
    float32 xMin
    float32 yMax
    float32 yMin
    float32 zMax
    float32 zMin
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Range3D(null);
    if (msg.xMax !== undefined) {
      resolved.xMax = msg.xMax;
    }
    else {
      resolved.xMax = 0.0
    }

    if (msg.xMin !== undefined) {
      resolved.xMin = msg.xMin;
    }
    else {
      resolved.xMin = 0.0
    }

    if (msg.yMax !== undefined) {
      resolved.yMax = msg.yMax;
    }
    else {
      resolved.yMax = 0.0
    }

    if (msg.yMin !== undefined) {
      resolved.yMin = msg.yMin;
    }
    else {
      resolved.yMin = 0.0
    }

    if (msg.zMax !== undefined) {
      resolved.zMax = msg.zMax;
    }
    else {
      resolved.zMax = 0.0
    }

    if (msg.zMin !== undefined) {
      resolved.zMin = msg.zMin;
    }
    else {
      resolved.zMin = 0.0
    }

    return resolved;
    }
};

module.exports = Range3D;
