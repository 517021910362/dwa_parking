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

class cdm_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Veh_Mass = null;
      this.Front_Hydraulic_BrakeFd = null;
      this.Rear_Hydraulic_BrakeFd = null;
      this.DriveModeFd = null;
      this.Load_BrakeFd = null;
      this.Compartment_Fd = null;
      this.Vehicle_FaultLevel = null;
      this.Veh_Spd = null;
      this.Fuel_Signal = null;
      this.Engine_Speed = null;
      this.TCM_GearFd = null;
      this.Steer_fd = null;
      this.Lat_State = null;
    }
    else {
      if (initObj.hasOwnProperty('Veh_Mass')) {
        this.Veh_Mass = initObj.Veh_Mass
      }
      else {
        this.Veh_Mass = 0;
      }
      if (initObj.hasOwnProperty('Front_Hydraulic_BrakeFd')) {
        this.Front_Hydraulic_BrakeFd = initObj.Front_Hydraulic_BrakeFd
      }
      else {
        this.Front_Hydraulic_BrakeFd = 0;
      }
      if (initObj.hasOwnProperty('Rear_Hydraulic_BrakeFd')) {
        this.Rear_Hydraulic_BrakeFd = initObj.Rear_Hydraulic_BrakeFd
      }
      else {
        this.Rear_Hydraulic_BrakeFd = 0;
      }
      if (initObj.hasOwnProperty('DriveModeFd')) {
        this.DriveModeFd = initObj.DriveModeFd
      }
      else {
        this.DriveModeFd = 0;
      }
      if (initObj.hasOwnProperty('Load_BrakeFd')) {
        this.Load_BrakeFd = initObj.Load_BrakeFd
      }
      else {
        this.Load_BrakeFd = 0;
      }
      if (initObj.hasOwnProperty('Compartment_Fd')) {
        this.Compartment_Fd = initObj.Compartment_Fd
      }
      else {
        this.Compartment_Fd = 0;
      }
      if (initObj.hasOwnProperty('Vehicle_FaultLevel')) {
        this.Vehicle_FaultLevel = initObj.Vehicle_FaultLevel
      }
      else {
        this.Vehicle_FaultLevel = 0;
      }
      if (initObj.hasOwnProperty('Veh_Spd')) {
        this.Veh_Spd = initObj.Veh_Spd
      }
      else {
        this.Veh_Spd = 0.0;
      }
      if (initObj.hasOwnProperty('Fuel_Signal')) {
        this.Fuel_Signal = initObj.Fuel_Signal
      }
      else {
        this.Fuel_Signal = 0;
      }
      if (initObj.hasOwnProperty('Engine_Speed')) {
        this.Engine_Speed = initObj.Engine_Speed
      }
      else {
        this.Engine_Speed = 0;
      }
      if (initObj.hasOwnProperty('TCM_GearFd')) {
        this.TCM_GearFd = initObj.TCM_GearFd
      }
      else {
        this.TCM_GearFd = 0;
      }
      if (initObj.hasOwnProperty('Steer_fd')) {
        this.Steer_fd = initObj.Steer_fd
      }
      else {
        this.Steer_fd = 0;
      }
      if (initObj.hasOwnProperty('Lat_State')) {
        this.Lat_State = initObj.Lat_State
      }
      else {
        this.Lat_State = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cdm_cmd
    // Serialize message field [Veh_Mass]
    bufferOffset = _serializer.uint8(obj.Veh_Mass, buffer, bufferOffset);
    // Serialize message field [Front_Hydraulic_BrakeFd]
    bufferOffset = _serializer.uint8(obj.Front_Hydraulic_BrakeFd, buffer, bufferOffset);
    // Serialize message field [Rear_Hydraulic_BrakeFd]
    bufferOffset = _serializer.uint8(obj.Rear_Hydraulic_BrakeFd, buffer, bufferOffset);
    // Serialize message field [DriveModeFd]
    bufferOffset = _serializer.uint8(obj.DriveModeFd, buffer, bufferOffset);
    // Serialize message field [Load_BrakeFd]
    bufferOffset = _serializer.uint8(obj.Load_BrakeFd, buffer, bufferOffset);
    // Serialize message field [Compartment_Fd]
    bufferOffset = _serializer.uint8(obj.Compartment_Fd, buffer, bufferOffset);
    // Serialize message field [Vehicle_FaultLevel]
    bufferOffset = _serializer.uint8(obj.Vehicle_FaultLevel, buffer, bufferOffset);
    // Serialize message field [Veh_Spd]
    bufferOffset = _serializer.float32(obj.Veh_Spd, buffer, bufferOffset);
    // Serialize message field [Fuel_Signal]
    bufferOffset = _serializer.uint8(obj.Fuel_Signal, buffer, bufferOffset);
    // Serialize message field [Engine_Speed]
    bufferOffset = _serializer.uint16(obj.Engine_Speed, buffer, bufferOffset);
    // Serialize message field [TCM_GearFd]
    bufferOffset = _serializer.int8(obj.TCM_GearFd, buffer, bufferOffset);
    // Serialize message field [Steer_fd]
    bufferOffset = _serializer.uint32(obj.Steer_fd, buffer, bufferOffset);
    // Serialize message field [Lat_State]
    bufferOffset = _serializer.uint8(obj.Lat_State, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cdm_cmd
    let len;
    let data = new cdm_cmd(null);
    // Deserialize message field [Veh_Mass]
    data.Veh_Mass = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Front_Hydraulic_BrakeFd]
    data.Front_Hydraulic_BrakeFd = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Rear_Hydraulic_BrakeFd]
    data.Rear_Hydraulic_BrakeFd = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DriveModeFd]
    data.DriveModeFd = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Load_BrakeFd]
    data.Load_BrakeFd = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Compartment_Fd]
    data.Compartment_Fd = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Vehicle_FaultLevel]
    data.Vehicle_FaultLevel = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Veh_Spd]
    data.Veh_Spd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Fuel_Signal]
    data.Fuel_Signal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Engine_Speed]
    data.Engine_Speed = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [TCM_GearFd]
    data.TCM_GearFd = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [Steer_fd]
    data.Steer_fd = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Lat_State]
    data.Lat_State = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/cdm_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b69952894d338c32418394971da76f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 Veh_Mass
    uint8 Front_Hydraulic_BrakeFd
    uint8 Rear_Hydraulic_BrakeFd
    uint8 DriveModeFd
    uint8 Load_BrakeFd
    #uint8 Compartment_Up
    #uint8 Compartment_Down
    #uint8 Compartment_UpHighest
    #uint8 Compartment_UpLowest
    uint8 Compartment_Fd
    uint8 Vehicle_FaultLevel
    float32 Veh_Spd
    uint8 Fuel_Signal
    uint16 Engine_Speed
    int8 TCM_GearFd
    uint32 Steer_fd
    uint8 Lat_State
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cdm_cmd(null);
    if (msg.Veh_Mass !== undefined) {
      resolved.Veh_Mass = msg.Veh_Mass;
    }
    else {
      resolved.Veh_Mass = 0
    }

    if (msg.Front_Hydraulic_BrakeFd !== undefined) {
      resolved.Front_Hydraulic_BrakeFd = msg.Front_Hydraulic_BrakeFd;
    }
    else {
      resolved.Front_Hydraulic_BrakeFd = 0
    }

    if (msg.Rear_Hydraulic_BrakeFd !== undefined) {
      resolved.Rear_Hydraulic_BrakeFd = msg.Rear_Hydraulic_BrakeFd;
    }
    else {
      resolved.Rear_Hydraulic_BrakeFd = 0
    }

    if (msg.DriveModeFd !== undefined) {
      resolved.DriveModeFd = msg.DriveModeFd;
    }
    else {
      resolved.DriveModeFd = 0
    }

    if (msg.Load_BrakeFd !== undefined) {
      resolved.Load_BrakeFd = msg.Load_BrakeFd;
    }
    else {
      resolved.Load_BrakeFd = 0
    }

    if (msg.Compartment_Fd !== undefined) {
      resolved.Compartment_Fd = msg.Compartment_Fd;
    }
    else {
      resolved.Compartment_Fd = 0
    }

    if (msg.Vehicle_FaultLevel !== undefined) {
      resolved.Vehicle_FaultLevel = msg.Vehicle_FaultLevel;
    }
    else {
      resolved.Vehicle_FaultLevel = 0
    }

    if (msg.Veh_Spd !== undefined) {
      resolved.Veh_Spd = msg.Veh_Spd;
    }
    else {
      resolved.Veh_Spd = 0.0
    }

    if (msg.Fuel_Signal !== undefined) {
      resolved.Fuel_Signal = msg.Fuel_Signal;
    }
    else {
      resolved.Fuel_Signal = 0
    }

    if (msg.Engine_Speed !== undefined) {
      resolved.Engine_Speed = msg.Engine_Speed;
    }
    else {
      resolved.Engine_Speed = 0
    }

    if (msg.TCM_GearFd !== undefined) {
      resolved.TCM_GearFd = msg.TCM_GearFd;
    }
    else {
      resolved.TCM_GearFd = 0
    }

    if (msg.Steer_fd !== undefined) {
      resolved.Steer_fd = msg.Steer_fd;
    }
    else {
      resolved.Steer_fd = 0
    }

    if (msg.Lat_State !== undefined) {
      resolved.Lat_State = msg.Lat_State;
    }
    else {
      resolved.Lat_State = 0
    }

    return resolved;
    }
};

module.exports = cdm_cmd;
