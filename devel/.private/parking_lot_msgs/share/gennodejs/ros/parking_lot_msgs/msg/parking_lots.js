// Auto-generated. Do not edit!

// (in-package parking_lot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let parking_lot = require('./parking_lot.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class parking_lots {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.parking_lots = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('parking_lots')) {
        this.parking_lots = initObj.parking_lots
      }
      else {
        this.parking_lots = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type parking_lots
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [parking_lots]
    // Serialize the length for message field [parking_lots]
    bufferOffset = _serializer.uint32(obj.parking_lots.length, buffer, bufferOffset);
    obj.parking_lots.forEach((val) => {
      bufferOffset = parking_lot.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type parking_lots
    let len;
    let data = new parking_lots(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [parking_lots]
    // Deserialize array length for message field [parking_lots]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.parking_lots = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.parking_lots[i] = parking_lot.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.parking_lots.forEach((val) => {
      length += parking_lot.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'parking_lot_msgs/parking_lots';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '192e520702045372955648661836b8ae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 全局
    Header header
    parking_lot[] parking_lots
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: parking_lot_msgs/parking_lot
    # 全局
    Header header
    
    # 车辆最终泊进车位时 从上往下看
    geometry_msgs/Point corner_left_upper
    geometry_msgs/Point corner_left_low
    geometry_msgs/Point corner_right_upper
    geometry_msgs/Point corner_right_low
    
    geometry_msgs/Point center           # 方块的中心
    geometry_msgs/Point entrance_center  # 入口边的中心
    
    int8 type  # 0- 垂直  1 - 侧方位 
    int8 is_occupied # 0- 无占据 1- 占据
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new parking_lots(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.parking_lots !== undefined) {
      resolved.parking_lots = new Array(msg.parking_lots.length);
      for (let i = 0; i < resolved.parking_lots.length; ++i) {
        resolved.parking_lots[i] = parking_lot.Resolve(msg.parking_lots[i]);
      }
    }
    else {
      resolved.parking_lots = []
    }

    return resolved;
    }
};

module.exports = parking_lots;
