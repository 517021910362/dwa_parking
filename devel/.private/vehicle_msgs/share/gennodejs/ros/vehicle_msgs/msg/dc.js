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

class dc {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DC_command = null;
      this.DC_entranceRequest = null;
      this.DC_parkingRequest = null;
      this.Excavator_AngleRoll = null;
      this.Excavator_Anglepitch = null;
      this.Excavator_AngleHeading = null;
      this.Excavator_PosLon = null;
      this.Excavator_PosLat = null;
      this.DC_truckFinish = null;
      this.MQTT_GateStatus = null;
      this.Excavator_ImuStatus = null;
      this.DC_VehControlReq = null;
      this.DC_DispatchReq = null;
      this.road_List = null;
    }
    else {
      if (initObj.hasOwnProperty('DC_command')) {
        this.DC_command = initObj.DC_command
      }
      else {
        this.DC_command = 0;
      }
      if (initObj.hasOwnProperty('DC_entranceRequest')) {
        this.DC_entranceRequest = initObj.DC_entranceRequest
      }
      else {
        this.DC_entranceRequest = 0;
      }
      if (initObj.hasOwnProperty('DC_parkingRequest')) {
        this.DC_parkingRequest = initObj.DC_parkingRequest
      }
      else {
        this.DC_parkingRequest = 0;
      }
      if (initObj.hasOwnProperty('Excavator_AngleRoll')) {
        this.Excavator_AngleRoll = initObj.Excavator_AngleRoll
      }
      else {
        this.Excavator_AngleRoll = 0.0;
      }
      if (initObj.hasOwnProperty('Excavator_Anglepitch')) {
        this.Excavator_Anglepitch = initObj.Excavator_Anglepitch
      }
      else {
        this.Excavator_Anglepitch = 0.0;
      }
      if (initObj.hasOwnProperty('Excavator_AngleHeading')) {
        this.Excavator_AngleHeading = initObj.Excavator_AngleHeading
      }
      else {
        this.Excavator_AngleHeading = 0.0;
      }
      if (initObj.hasOwnProperty('Excavator_PosLon')) {
        this.Excavator_PosLon = initObj.Excavator_PosLon
      }
      else {
        this.Excavator_PosLon = 0.0;
      }
      if (initObj.hasOwnProperty('Excavator_PosLat')) {
        this.Excavator_PosLat = initObj.Excavator_PosLat
      }
      else {
        this.Excavator_PosLat = 0.0;
      }
      if (initObj.hasOwnProperty('DC_truckFinish')) {
        this.DC_truckFinish = initObj.DC_truckFinish
      }
      else {
        this.DC_truckFinish = 0;
      }
      if (initObj.hasOwnProperty('MQTT_GateStatus')) {
        this.MQTT_GateStatus = initObj.MQTT_GateStatus
      }
      else {
        this.MQTT_GateStatus = 0;
      }
      if (initObj.hasOwnProperty('Excavator_ImuStatus')) {
        this.Excavator_ImuStatus = initObj.Excavator_ImuStatus
      }
      else {
        this.Excavator_ImuStatus = 0;
      }
      if (initObj.hasOwnProperty('DC_VehControlReq')) {
        this.DC_VehControlReq = initObj.DC_VehControlReq
      }
      else {
        this.DC_VehControlReq = 0;
      }
      if (initObj.hasOwnProperty('DC_DispatchReq')) {
        this.DC_DispatchReq = initObj.DC_DispatchReq
      }
      else {
        this.DC_DispatchReq = 0;
      }
      if (initObj.hasOwnProperty('road_List')) {
        this.road_List = initObj.road_List
      }
      else {
        this.road_List = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dc
    // Serialize message field [DC_command]
    bufferOffset = _serializer.uint8(obj.DC_command, buffer, bufferOffset);
    // Serialize message field [DC_entranceRequest]
    bufferOffset = _serializer.uint8(obj.DC_entranceRequest, buffer, bufferOffset);
    // Serialize message field [DC_parkingRequest]
    bufferOffset = _serializer.uint8(obj.DC_parkingRequest, buffer, bufferOffset);
    // Serialize message field [Excavator_AngleRoll]
    bufferOffset = _serializer.float32(obj.Excavator_AngleRoll, buffer, bufferOffset);
    // Serialize message field [Excavator_Anglepitch]
    bufferOffset = _serializer.float32(obj.Excavator_Anglepitch, buffer, bufferOffset);
    // Serialize message field [Excavator_AngleHeading]
    bufferOffset = _serializer.float32(obj.Excavator_AngleHeading, buffer, bufferOffset);
    // Serialize message field [Excavator_PosLon]
    bufferOffset = _serializer.float32(obj.Excavator_PosLon, buffer, bufferOffset);
    // Serialize message field [Excavator_PosLat]
    bufferOffset = _serializer.float32(obj.Excavator_PosLat, buffer, bufferOffset);
    // Serialize message field [DC_truckFinish]
    bufferOffset = _serializer.uint8(obj.DC_truckFinish, buffer, bufferOffset);
    // Serialize message field [MQTT_GateStatus]
    bufferOffset = _serializer.uint8(obj.MQTT_GateStatus, buffer, bufferOffset);
    // Serialize message field [Excavator_ImuStatus]
    bufferOffset = _serializer.uint8(obj.Excavator_ImuStatus, buffer, bufferOffset);
    // Serialize message field [DC_VehControlReq]
    bufferOffset = _serializer.uint8(obj.DC_VehControlReq, buffer, bufferOffset);
    // Serialize message field [DC_DispatchReq]
    bufferOffset = _serializer.uint8(obj.DC_DispatchReq, buffer, bufferOffset);
    // Serialize message field [road_List]
    bufferOffset = _serializer.string(obj.road_List, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dc
    let len;
    let data = new dc(null);
    // Deserialize message field [DC_command]
    data.DC_command = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DC_entranceRequest]
    data.DC_entranceRequest = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DC_parkingRequest]
    data.DC_parkingRequest = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Excavator_AngleRoll]
    data.Excavator_AngleRoll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Excavator_Anglepitch]
    data.Excavator_Anglepitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Excavator_AngleHeading]
    data.Excavator_AngleHeading = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Excavator_PosLon]
    data.Excavator_PosLon = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Excavator_PosLat]
    data.Excavator_PosLat = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [DC_truckFinish]
    data.DC_truckFinish = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [MQTT_GateStatus]
    data.MQTT_GateStatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Excavator_ImuStatus]
    data.Excavator_ImuStatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DC_VehControlReq]
    data.DC_VehControlReq = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DC_DispatchReq]
    data.DC_DispatchReq = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [road_List]
    data.road_List = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.road_List.length;
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/dc';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea6e5c96799e7b32503d5842a24d9a14';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 DC_command
    uint8 DC_entranceRequest
    uint8 DC_parkingRequest
    float32 Excavator_AngleRoll
    float32 Excavator_Anglepitch
    float32 Excavator_AngleHeading
    float32 Excavator_PosLon
    float32 Excavator_PosLat
    uint8 DC_truckFinish
    uint8 MQTT_GateStatus
    uint8 Excavator_ImuStatus
    uint8 DC_VehControlReq
    uint8 DC_DispatchReq
    string road_List
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dc(null);
    if (msg.DC_command !== undefined) {
      resolved.DC_command = msg.DC_command;
    }
    else {
      resolved.DC_command = 0
    }

    if (msg.DC_entranceRequest !== undefined) {
      resolved.DC_entranceRequest = msg.DC_entranceRequest;
    }
    else {
      resolved.DC_entranceRequest = 0
    }

    if (msg.DC_parkingRequest !== undefined) {
      resolved.DC_parkingRequest = msg.DC_parkingRequest;
    }
    else {
      resolved.DC_parkingRequest = 0
    }

    if (msg.Excavator_AngleRoll !== undefined) {
      resolved.Excavator_AngleRoll = msg.Excavator_AngleRoll;
    }
    else {
      resolved.Excavator_AngleRoll = 0.0
    }

    if (msg.Excavator_Anglepitch !== undefined) {
      resolved.Excavator_Anglepitch = msg.Excavator_Anglepitch;
    }
    else {
      resolved.Excavator_Anglepitch = 0.0
    }

    if (msg.Excavator_AngleHeading !== undefined) {
      resolved.Excavator_AngleHeading = msg.Excavator_AngleHeading;
    }
    else {
      resolved.Excavator_AngleHeading = 0.0
    }

    if (msg.Excavator_PosLon !== undefined) {
      resolved.Excavator_PosLon = msg.Excavator_PosLon;
    }
    else {
      resolved.Excavator_PosLon = 0.0
    }

    if (msg.Excavator_PosLat !== undefined) {
      resolved.Excavator_PosLat = msg.Excavator_PosLat;
    }
    else {
      resolved.Excavator_PosLat = 0.0
    }

    if (msg.DC_truckFinish !== undefined) {
      resolved.DC_truckFinish = msg.DC_truckFinish;
    }
    else {
      resolved.DC_truckFinish = 0
    }

    if (msg.MQTT_GateStatus !== undefined) {
      resolved.MQTT_GateStatus = msg.MQTT_GateStatus;
    }
    else {
      resolved.MQTT_GateStatus = 0
    }

    if (msg.Excavator_ImuStatus !== undefined) {
      resolved.Excavator_ImuStatus = msg.Excavator_ImuStatus;
    }
    else {
      resolved.Excavator_ImuStatus = 0
    }

    if (msg.DC_VehControlReq !== undefined) {
      resolved.DC_VehControlReq = msg.DC_VehControlReq;
    }
    else {
      resolved.DC_VehControlReq = 0
    }

    if (msg.DC_DispatchReq !== undefined) {
      resolved.DC_DispatchReq = msg.DC_DispatchReq;
    }
    else {
      resolved.DC_DispatchReq = 0
    }

    if (msg.road_List !== undefined) {
      resolved.road_List = msg.road_List;
    }
    else {
      resolved.road_List = ''
    }

    return resolved;
    }
};

module.exports = dc;
