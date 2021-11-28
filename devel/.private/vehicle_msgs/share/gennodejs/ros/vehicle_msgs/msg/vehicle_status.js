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

class vehicle_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.head1 = null;
      this.head2 = null;
      this.length = null;
      this.steering = null;
      this.brake_status = null;
      this.pedal_ratio = null;
      this.gear_position = null;
      this.speed_left_front = null;
      this.speed_right_front = null;
      this.speed_left_rear = null;
      this.speed_right_rear = null;
      this.command = null;
      this.work_mode = null;
      this.racing_num = null;
      this.fault_type = null;
      this.checksum = null;
    }
    else {
      if (initObj.hasOwnProperty('head1')) {
        this.head1 = initObj.head1
      }
      else {
        this.head1 = 0;
      }
      if (initObj.hasOwnProperty('head2')) {
        this.head2 = initObj.head2
      }
      else {
        this.head2 = 0;
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0;
      }
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0;
      }
      if (initObj.hasOwnProperty('brake_status')) {
        this.brake_status = initObj.brake_status
      }
      else {
        this.brake_status = 0;
      }
      if (initObj.hasOwnProperty('pedal_ratio')) {
        this.pedal_ratio = initObj.pedal_ratio
      }
      else {
        this.pedal_ratio = 0;
      }
      if (initObj.hasOwnProperty('gear_position')) {
        this.gear_position = initObj.gear_position
      }
      else {
        this.gear_position = 0;
      }
      if (initObj.hasOwnProperty('speed_left_front')) {
        this.speed_left_front = initObj.speed_left_front
      }
      else {
        this.speed_left_front = 0;
      }
      if (initObj.hasOwnProperty('speed_right_front')) {
        this.speed_right_front = initObj.speed_right_front
      }
      else {
        this.speed_right_front = 0;
      }
      if (initObj.hasOwnProperty('speed_left_rear')) {
        this.speed_left_rear = initObj.speed_left_rear
      }
      else {
        this.speed_left_rear = 0;
      }
      if (initObj.hasOwnProperty('speed_right_rear')) {
        this.speed_right_rear = initObj.speed_right_rear
      }
      else {
        this.speed_right_rear = 0;
      }
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
      if (initObj.hasOwnProperty('work_mode')) {
        this.work_mode = initObj.work_mode
      }
      else {
        this.work_mode = 0;
      }
      if (initObj.hasOwnProperty('racing_num')) {
        this.racing_num = initObj.racing_num
      }
      else {
        this.racing_num = 0;
      }
      if (initObj.hasOwnProperty('fault_type')) {
        this.fault_type = initObj.fault_type
      }
      else {
        this.fault_type = 0;
      }
      if (initObj.hasOwnProperty('checksum')) {
        this.checksum = initObj.checksum
      }
      else {
        this.checksum = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vehicle_status
    // Serialize message field [head1]
    bufferOffset = _serializer.uint8(obj.head1, buffer, bufferOffset);
    // Serialize message field [head2]
    bufferOffset = _serializer.uint8(obj.head2, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.uint8(obj.length, buffer, bufferOffset);
    // Serialize message field [steering]
    bufferOffset = _serializer.uint8(obj.steering, buffer, bufferOffset);
    // Serialize message field [brake_status]
    bufferOffset = _serializer.uint8(obj.brake_status, buffer, bufferOffset);
    // Serialize message field [pedal_ratio]
    bufferOffset = _serializer.uint8(obj.pedal_ratio, buffer, bufferOffset);
    // Serialize message field [gear_position]
    bufferOffset = _serializer.uint8(obj.gear_position, buffer, bufferOffset);
    // Serialize message field [speed_left_front]
    bufferOffset = _serializer.uint16(obj.speed_left_front, buffer, bufferOffset);
    // Serialize message field [speed_right_front]
    bufferOffset = _serializer.uint16(obj.speed_right_front, buffer, bufferOffset);
    // Serialize message field [speed_left_rear]
    bufferOffset = _serializer.uint16(obj.speed_left_rear, buffer, bufferOffset);
    // Serialize message field [speed_right_rear]
    bufferOffset = _serializer.uint16(obj.speed_right_rear, buffer, bufferOffset);
    // Serialize message field [command]
    bufferOffset = _serializer.uint8(obj.command, buffer, bufferOffset);
    // Serialize message field [work_mode]
    bufferOffset = _serializer.uint8(obj.work_mode, buffer, bufferOffset);
    // Serialize message field [racing_num]
    bufferOffset = _serializer.uint8(obj.racing_num, buffer, bufferOffset);
    // Serialize message field [fault_type]
    bufferOffset = _serializer.uint8(obj.fault_type, buffer, bufferOffset);
    // Serialize message field [checksum]
    bufferOffset = _serializer.uint16(obj.checksum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vehicle_status
    let len;
    let data = new vehicle_status(null);
    // Deserialize message field [head1]
    data.head1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [head2]
    data.head2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steering]
    data.steering = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [brake_status]
    data.brake_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pedal_ratio]
    data.pedal_ratio = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gear_position]
    data.gear_position = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [speed_left_front]
    data.speed_left_front = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [speed_right_front]
    data.speed_right_front = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [speed_left_rear]
    data.speed_left_rear = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [speed_right_rear]
    data.speed_right_rear = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [command]
    data.command = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [work_mode]
    data.work_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [racing_num]
    data.racing_num = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fault_type]
    data.fault_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [checksum]
    data.checksum = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/vehicle_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '846750d88d04873a7a68c897999f240c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 head1
    uint8 head2
    uint8 length
    uint8 steering
    uint8 brake_status
    uint8 pedal_ratio
    uint8 gear_position
    uint16 speed_left_front
    uint16 speed_right_front
    uint16 speed_left_rear
    uint16 speed_right_rear
    uint8 command
    uint8 work_mode
    uint8 racing_num
    uint8 fault_type
    uint16 checksum
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vehicle_status(null);
    if (msg.head1 !== undefined) {
      resolved.head1 = msg.head1;
    }
    else {
      resolved.head1 = 0
    }

    if (msg.head2 !== undefined) {
      resolved.head2 = msg.head2;
    }
    else {
      resolved.head2 = 0
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0
    }

    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0
    }

    if (msg.brake_status !== undefined) {
      resolved.brake_status = msg.brake_status;
    }
    else {
      resolved.brake_status = 0
    }

    if (msg.pedal_ratio !== undefined) {
      resolved.pedal_ratio = msg.pedal_ratio;
    }
    else {
      resolved.pedal_ratio = 0
    }

    if (msg.gear_position !== undefined) {
      resolved.gear_position = msg.gear_position;
    }
    else {
      resolved.gear_position = 0
    }

    if (msg.speed_left_front !== undefined) {
      resolved.speed_left_front = msg.speed_left_front;
    }
    else {
      resolved.speed_left_front = 0
    }

    if (msg.speed_right_front !== undefined) {
      resolved.speed_right_front = msg.speed_right_front;
    }
    else {
      resolved.speed_right_front = 0
    }

    if (msg.speed_left_rear !== undefined) {
      resolved.speed_left_rear = msg.speed_left_rear;
    }
    else {
      resolved.speed_left_rear = 0
    }

    if (msg.speed_right_rear !== undefined) {
      resolved.speed_right_rear = msg.speed_right_rear;
    }
    else {
      resolved.speed_right_rear = 0
    }

    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    if (msg.work_mode !== undefined) {
      resolved.work_mode = msg.work_mode;
    }
    else {
      resolved.work_mode = 0
    }

    if (msg.racing_num !== undefined) {
      resolved.racing_num = msg.racing_num;
    }
    else {
      resolved.racing_num = 0
    }

    if (msg.fault_type !== undefined) {
      resolved.fault_type = msg.fault_type;
    }
    else {
      resolved.fault_type = 0
    }

    if (msg.checksum !== undefined) {
      resolved.checksum = msg.checksum;
    }
    else {
      resolved.checksum = 0
    }

    return resolved;
    }
};

module.exports = vehicle_status;
