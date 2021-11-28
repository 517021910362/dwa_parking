// Auto-generated. Do not edit!

// (in-package location_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class RTK {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
      this.stamp = null;
      this.gpstime = null;
      this.longitude = null;
      this.latitude = null;
      this.height = null;
      this.heading = null;
      this.pitch = null;
      this.roll = null;
      this.velocity = null;
      this.AccelRawX = null;
      this.AccelRawY = null;
      this.AccelRawZ = null;
      this.AngRateRawX = null;
      this.AngRateRawY = null;
      this.AngRateRawZ = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('gpstime')) {
        this.gpstime = initObj.gpstime
      }
      else {
        this.gpstime = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('AccelRawX')) {
        this.AccelRawX = initObj.AccelRawX
      }
      else {
        this.AccelRawX = 0.0;
      }
      if (initObj.hasOwnProperty('AccelRawY')) {
        this.AccelRawY = initObj.AccelRawY
      }
      else {
        this.AccelRawY = 0.0;
      }
      if (initObj.hasOwnProperty('AccelRawZ')) {
        this.AccelRawZ = initObj.AccelRawZ
      }
      else {
        this.AccelRawZ = 0.0;
      }
      if (initObj.hasOwnProperty('AngRateRawX')) {
        this.AngRateRawX = initObj.AngRateRawX
      }
      else {
        this.AngRateRawX = 0.0;
      }
      if (initObj.hasOwnProperty('AngRateRawY')) {
        this.AngRateRawY = initObj.AngRateRawY
      }
      else {
        this.AngRateRawY = 0.0;
      }
      if (initObj.hasOwnProperty('AngRateRawZ')) {
        this.AngRateRawZ = initObj.AngRateRawZ
      }
      else {
        this.AngRateRawZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RTK
    // Serialize message field [status]
    bufferOffset = _serializer.int32(obj.status, buffer, bufferOffset);
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [gpstime]
    bufferOffset = _serializer.float64(obj.gpstime, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float64(obj.height, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float64(obj.heading, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float64(obj.pitch, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float64(obj.roll, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    // Serialize message field [AccelRawX]
    bufferOffset = _serializer.float64(obj.AccelRawX, buffer, bufferOffset);
    // Serialize message field [AccelRawY]
    bufferOffset = _serializer.float64(obj.AccelRawY, buffer, bufferOffset);
    // Serialize message field [AccelRawZ]
    bufferOffset = _serializer.float64(obj.AccelRawZ, buffer, bufferOffset);
    // Serialize message field [AngRateRawX]
    bufferOffset = _serializer.float64(obj.AngRateRawX, buffer, bufferOffset);
    // Serialize message field [AngRateRawY]
    bufferOffset = _serializer.float64(obj.AngRateRawY, buffer, bufferOffset);
    // Serialize message field [AngRateRawZ]
    bufferOffset = _serializer.float64(obj.AngRateRawZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RTK
    let len;
    let data = new RTK(null);
    // Deserialize message field [status]
    data.status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [gpstime]
    data.gpstime = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AccelRawX]
    data.AccelRawX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AccelRawY]
    data.AccelRawY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AccelRawZ]
    data.AccelRawZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AngRateRawX]
    data.AngRateRawX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AngRateRawY]
    data.AngRateRawY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AngRateRawZ]
    data.AngRateRawZ = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 124;
  }

  static datatype() {
    // Returns string type for a message object
    return 'location_msgs/RTK';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14854cd4132bb36ed5bbe6de9299da19';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 status
    time stamp
    float64 gpstime
    
    float64 longitude
    float64 latitude
    float64 height
    
    float64 heading
    float64 pitch
    float64 roll
    
    float64 velocity
    
    float64 AccelRawX
    float64 AccelRawY
    float64 AccelRawZ
    
    float64 AngRateRawX
    float64 AngRateRawY
    float64 AngRateRawZ
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RTK(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.gpstime !== undefined) {
      resolved.gpstime = msg.gpstime;
    }
    else {
      resolved.gpstime = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.AccelRawX !== undefined) {
      resolved.AccelRawX = msg.AccelRawX;
    }
    else {
      resolved.AccelRawX = 0.0
    }

    if (msg.AccelRawY !== undefined) {
      resolved.AccelRawY = msg.AccelRawY;
    }
    else {
      resolved.AccelRawY = 0.0
    }

    if (msg.AccelRawZ !== undefined) {
      resolved.AccelRawZ = msg.AccelRawZ;
    }
    else {
      resolved.AccelRawZ = 0.0
    }

    if (msg.AngRateRawX !== undefined) {
      resolved.AngRateRawX = msg.AngRateRawX;
    }
    else {
      resolved.AngRateRawX = 0.0
    }

    if (msg.AngRateRawY !== undefined) {
      resolved.AngRateRawY = msg.AngRateRawY;
    }
    else {
      resolved.AngRateRawY = 0.0
    }

    if (msg.AngRateRawZ !== undefined) {
      resolved.AngRateRawZ = msg.AngRateRawZ;
    }
    else {
      resolved.AngRateRawZ = 0.0
    }

    return resolved;
    }
};

module.exports = RTK;
