// Auto-generated. Do not edit!

// (in-package parking_lot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class parking_lot {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.corner_left_upper = null;
      this.corner_left_low = null;
      this.corner_right_upper = null;
      this.corner_right_low = null;
      this.center = null;
      this.entrance_center = null;
      this.type = null;
      this.is_occupied = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('corner_left_upper')) {
        this.corner_left_upper = initObj.corner_left_upper
      }
      else {
        this.corner_left_upper = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('corner_left_low')) {
        this.corner_left_low = initObj.corner_left_low
      }
      else {
        this.corner_left_low = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('corner_right_upper')) {
        this.corner_right_upper = initObj.corner_right_upper
      }
      else {
        this.corner_right_upper = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('corner_right_low')) {
        this.corner_right_low = initObj.corner_right_low
      }
      else {
        this.corner_right_low = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('entrance_center')) {
        this.entrance_center = initObj.entrance_center
      }
      else {
        this.entrance_center = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('is_occupied')) {
        this.is_occupied = initObj.is_occupied
      }
      else {
        this.is_occupied = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type parking_lot
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [corner_left_upper]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner_left_upper, buffer, bufferOffset);
    // Serialize message field [corner_left_low]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner_left_low, buffer, bufferOffset);
    // Serialize message field [corner_right_upper]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner_right_upper, buffer, bufferOffset);
    // Serialize message field [corner_right_low]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner_right_low, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [entrance_center]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.entrance_center, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int8(obj.type, buffer, bufferOffset);
    // Serialize message field [is_occupied]
    bufferOffset = _serializer.int8(obj.is_occupied, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type parking_lot
    let len;
    let data = new parking_lot(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner_left_upper]
    data.corner_left_upper = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner_left_low]
    data.corner_left_low = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner_right_upper]
    data.corner_right_upper = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner_right_low]
    data.corner_right_low = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [entrance_center]
    data.entrance_center = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [is_occupied]
    data.is_occupied = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 146;
  }

  static datatype() {
    // Returns string type for a message object
    return 'parking_lot_msgs/parking_lot';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '577a610f517c24e44cbfed4f97891954';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new parking_lot(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.corner_left_upper !== undefined) {
      resolved.corner_left_upper = geometry_msgs.msg.Point.Resolve(msg.corner_left_upper)
    }
    else {
      resolved.corner_left_upper = new geometry_msgs.msg.Point()
    }

    if (msg.corner_left_low !== undefined) {
      resolved.corner_left_low = geometry_msgs.msg.Point.Resolve(msg.corner_left_low)
    }
    else {
      resolved.corner_left_low = new geometry_msgs.msg.Point()
    }

    if (msg.corner_right_upper !== undefined) {
      resolved.corner_right_upper = geometry_msgs.msg.Point.Resolve(msg.corner_right_upper)
    }
    else {
      resolved.corner_right_upper = new geometry_msgs.msg.Point()
    }

    if (msg.corner_right_low !== undefined) {
      resolved.corner_right_low = geometry_msgs.msg.Point.Resolve(msg.corner_right_low)
    }
    else {
      resolved.corner_right_low = new geometry_msgs.msg.Point()
    }

    if (msg.center !== undefined) {
      resolved.center = geometry_msgs.msg.Point.Resolve(msg.center)
    }
    else {
      resolved.center = new geometry_msgs.msg.Point()
    }

    if (msg.entrance_center !== undefined) {
      resolved.entrance_center = geometry_msgs.msg.Point.Resolve(msg.entrance_center)
    }
    else {
      resolved.entrance_center = new geometry_msgs.msg.Point()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.is_occupied !== undefined) {
      resolved.is_occupied = msg.is_occupied;
    }
    else {
      resolved.is_occupied = 0
    }

    return resolved;
    }
};

module.exports = parking_lot;
