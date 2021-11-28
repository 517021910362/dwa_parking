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

class adm_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.AccPed = null;
      this.AccPed_enable = null;
      this.ADM_FaultLevel = null;
      this.Fog_Light = null;
      this.Horn = null;
      this.Hydraulic_Brake = null;
      this.High_BeamLigh = null;
      this.Low_BeamLight = null;
      this.Turn_Signal = null;
      this.Double_Light = null;
      this.Night_Light = null;
      this.Defroster_Control = null;
      this.Wiper_Control = null;
      this.Amble_Brake = null;
      this.Compartment_Control = null;
      this.Emergency_Brake = null;
      this.Load_Brake = null;
      this.Engine_Start = null;
      this.Engine_Stop = null;
      this.Road_DryorWet = null;
      this.Switch_DynamicorEconomical = null;
      this.Slope = null;
      this.Gear = null;
      this.GPS1_Curvature_cmd = null;
      this.finish_over = null;
    }
    else {
      if (initObj.hasOwnProperty('AccPed')) {
        this.AccPed = initObj.AccPed
      }
      else {
        this.AccPed = 0;
      }
      if (initObj.hasOwnProperty('AccPed_enable')) {
        this.AccPed_enable = initObj.AccPed_enable
      }
      else {
        this.AccPed_enable = 0;
      }
      if (initObj.hasOwnProperty('ADM_FaultLevel')) {
        this.ADM_FaultLevel = initObj.ADM_FaultLevel
      }
      else {
        this.ADM_FaultLevel = 0;
      }
      if (initObj.hasOwnProperty('Fog_Light')) {
        this.Fog_Light = initObj.Fog_Light
      }
      else {
        this.Fog_Light = 0;
      }
      if (initObj.hasOwnProperty('Horn')) {
        this.Horn = initObj.Horn
      }
      else {
        this.Horn = 0;
      }
      if (initObj.hasOwnProperty('Hydraulic_Brake')) {
        this.Hydraulic_Brake = initObj.Hydraulic_Brake
      }
      else {
        this.Hydraulic_Brake = 0;
      }
      if (initObj.hasOwnProperty('High_BeamLigh')) {
        this.High_BeamLigh = initObj.High_BeamLigh
      }
      else {
        this.High_BeamLigh = 0;
      }
      if (initObj.hasOwnProperty('Low_BeamLight')) {
        this.Low_BeamLight = initObj.Low_BeamLight
      }
      else {
        this.Low_BeamLight = 0;
      }
      if (initObj.hasOwnProperty('Turn_Signal')) {
        this.Turn_Signal = initObj.Turn_Signal
      }
      else {
        this.Turn_Signal = 0;
      }
      if (initObj.hasOwnProperty('Double_Light')) {
        this.Double_Light = initObj.Double_Light
      }
      else {
        this.Double_Light = 0;
      }
      if (initObj.hasOwnProperty('Night_Light')) {
        this.Night_Light = initObj.Night_Light
      }
      else {
        this.Night_Light = 0;
      }
      if (initObj.hasOwnProperty('Defroster_Control')) {
        this.Defroster_Control = initObj.Defroster_Control
      }
      else {
        this.Defroster_Control = 0;
      }
      if (initObj.hasOwnProperty('Wiper_Control')) {
        this.Wiper_Control = initObj.Wiper_Control
      }
      else {
        this.Wiper_Control = 0;
      }
      if (initObj.hasOwnProperty('Amble_Brake')) {
        this.Amble_Brake = initObj.Amble_Brake
      }
      else {
        this.Amble_Brake = 0;
      }
      if (initObj.hasOwnProperty('Compartment_Control')) {
        this.Compartment_Control = initObj.Compartment_Control
      }
      else {
        this.Compartment_Control = 0;
      }
      if (initObj.hasOwnProperty('Emergency_Brake')) {
        this.Emergency_Brake = initObj.Emergency_Brake
      }
      else {
        this.Emergency_Brake = 0;
      }
      if (initObj.hasOwnProperty('Load_Brake')) {
        this.Load_Brake = initObj.Load_Brake
      }
      else {
        this.Load_Brake = 0;
      }
      if (initObj.hasOwnProperty('Engine_Start')) {
        this.Engine_Start = initObj.Engine_Start
      }
      else {
        this.Engine_Start = 0;
      }
      if (initObj.hasOwnProperty('Engine_Stop')) {
        this.Engine_Stop = initObj.Engine_Stop
      }
      else {
        this.Engine_Stop = 0;
      }
      if (initObj.hasOwnProperty('Road_DryorWet')) {
        this.Road_DryorWet = initObj.Road_DryorWet
      }
      else {
        this.Road_DryorWet = 0;
      }
      if (initObj.hasOwnProperty('Switch_DynamicorEconomical')) {
        this.Switch_DynamicorEconomical = initObj.Switch_DynamicorEconomical
      }
      else {
        this.Switch_DynamicorEconomical = 0;
      }
      if (initObj.hasOwnProperty('Slope')) {
        this.Slope = initObj.Slope
      }
      else {
        this.Slope = 0;
      }
      if (initObj.hasOwnProperty('Gear')) {
        this.Gear = initObj.Gear
      }
      else {
        this.Gear = 0;
      }
      if (initObj.hasOwnProperty('GPS1_Curvature_cmd')) {
        this.GPS1_Curvature_cmd = initObj.GPS1_Curvature_cmd
      }
      else {
        this.GPS1_Curvature_cmd = 0.0;
      }
      if (initObj.hasOwnProperty('finish_over')) {
        this.finish_over = initObj.finish_over
      }
      else {
        this.finish_over = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type adm_cmd
    // Serialize message field [AccPed]
    bufferOffset = _serializer.uint8(obj.AccPed, buffer, bufferOffset);
    // Serialize message field [AccPed_enable]
    bufferOffset = _serializer.uint8(obj.AccPed_enable, buffer, bufferOffset);
    // Serialize message field [ADM_FaultLevel]
    bufferOffset = _serializer.uint8(obj.ADM_FaultLevel, buffer, bufferOffset);
    // Serialize message field [Fog_Light]
    bufferOffset = _serializer.uint8(obj.Fog_Light, buffer, bufferOffset);
    // Serialize message field [Horn]
    bufferOffset = _serializer.uint8(obj.Horn, buffer, bufferOffset);
    // Serialize message field [Hydraulic_Brake]
    bufferOffset = _serializer.uint8(obj.Hydraulic_Brake, buffer, bufferOffset);
    // Serialize message field [High_BeamLigh]
    bufferOffset = _serializer.uint8(obj.High_BeamLigh, buffer, bufferOffset);
    // Serialize message field [Low_BeamLight]
    bufferOffset = _serializer.uint8(obj.Low_BeamLight, buffer, bufferOffset);
    // Serialize message field [Turn_Signal]
    bufferOffset = _serializer.uint8(obj.Turn_Signal, buffer, bufferOffset);
    // Serialize message field [Double_Light]
    bufferOffset = _serializer.uint8(obj.Double_Light, buffer, bufferOffset);
    // Serialize message field [Night_Light]
    bufferOffset = _serializer.uint8(obj.Night_Light, buffer, bufferOffset);
    // Serialize message field [Defroster_Control]
    bufferOffset = _serializer.uint8(obj.Defroster_Control, buffer, bufferOffset);
    // Serialize message field [Wiper_Control]
    bufferOffset = _serializer.uint8(obj.Wiper_Control, buffer, bufferOffset);
    // Serialize message field [Amble_Brake]
    bufferOffset = _serializer.uint8(obj.Amble_Brake, buffer, bufferOffset);
    // Serialize message field [Compartment_Control]
    bufferOffset = _serializer.uint8(obj.Compartment_Control, buffer, bufferOffset);
    // Serialize message field [Emergency_Brake]
    bufferOffset = _serializer.uint8(obj.Emergency_Brake, buffer, bufferOffset);
    // Serialize message field [Load_Brake]
    bufferOffset = _serializer.uint8(obj.Load_Brake, buffer, bufferOffset);
    // Serialize message field [Engine_Start]
    bufferOffset = _serializer.uint8(obj.Engine_Start, buffer, bufferOffset);
    // Serialize message field [Engine_Stop]
    bufferOffset = _serializer.uint8(obj.Engine_Stop, buffer, bufferOffset);
    // Serialize message field [Road_DryorWet]
    bufferOffset = _serializer.uint8(obj.Road_DryorWet, buffer, bufferOffset);
    // Serialize message field [Switch_DynamicorEconomical]
    bufferOffset = _serializer.uint8(obj.Switch_DynamicorEconomical, buffer, bufferOffset);
    // Serialize message field [Slope]
    bufferOffset = _serializer.uint8(obj.Slope, buffer, bufferOffset);
    // Serialize message field [Gear]
    bufferOffset = _serializer.uint8(obj.Gear, buffer, bufferOffset);
    // Serialize message field [GPS1_Curvature_cmd]
    bufferOffset = _serializer.float32(obj.GPS1_Curvature_cmd, buffer, bufferOffset);
    // Serialize message field [finish_over]
    bufferOffset = _serializer.uint8(obj.finish_over, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type adm_cmd
    let len;
    let data = new adm_cmd(null);
    // Deserialize message field [AccPed]
    data.AccPed = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [AccPed_enable]
    data.AccPed_enable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ADM_FaultLevel]
    data.ADM_FaultLevel = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Fog_Light]
    data.Fog_Light = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Horn]
    data.Horn = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Hydraulic_Brake]
    data.Hydraulic_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [High_BeamLigh]
    data.High_BeamLigh = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Low_BeamLight]
    data.Low_BeamLight = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Turn_Signal]
    data.Turn_Signal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Double_Light]
    data.Double_Light = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Night_Light]
    data.Night_Light = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Defroster_Control]
    data.Defroster_Control = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Wiper_Control]
    data.Wiper_Control = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Amble_Brake]
    data.Amble_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Compartment_Control]
    data.Compartment_Control = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Emergency_Brake]
    data.Emergency_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Load_Brake]
    data.Load_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Engine_Start]
    data.Engine_Start = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Engine_Stop]
    data.Engine_Stop = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Road_DryorWet]
    data.Road_DryorWet = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Switch_DynamicorEconomical]
    data.Switch_DynamicorEconomical = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Slope]
    data.Slope = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Gear]
    data.Gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [GPS1_Curvature_cmd]
    data.GPS1_Curvature_cmd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [finish_over]
    data.finish_over = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/adm_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '03c23fc13499203340068a71426d1dfc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 AccPed
    uint8 AccPed_enable
    uint8 ADM_FaultLevel
    uint8 Fog_Light
    uint8 Horn
    uint8 Hydraulic_Brake
    uint8 High_BeamLigh
    uint8 Low_BeamLight
    uint8 Turn_Signal
    uint8 Double_Light
    
    uint8 Night_Light
    uint8 Defroster_Control
    uint8 Wiper_Control
    uint8 Amble_Brake
    uint8 Compartment_Control
    uint8 Emergency_Brake
    uint8 Load_Brake
    uint8 Engine_Start
    uint8 Engine_Stop
    uint8 Road_DryorWet
    uint8 Switch_DynamicorEconomical
    uint8 Slope
    uint8 Gear
    float32 GPS1_Curvature_cmd
    uint8 finish_over
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new adm_cmd(null);
    if (msg.AccPed !== undefined) {
      resolved.AccPed = msg.AccPed;
    }
    else {
      resolved.AccPed = 0
    }

    if (msg.AccPed_enable !== undefined) {
      resolved.AccPed_enable = msg.AccPed_enable;
    }
    else {
      resolved.AccPed_enable = 0
    }

    if (msg.ADM_FaultLevel !== undefined) {
      resolved.ADM_FaultLevel = msg.ADM_FaultLevel;
    }
    else {
      resolved.ADM_FaultLevel = 0
    }

    if (msg.Fog_Light !== undefined) {
      resolved.Fog_Light = msg.Fog_Light;
    }
    else {
      resolved.Fog_Light = 0
    }

    if (msg.Horn !== undefined) {
      resolved.Horn = msg.Horn;
    }
    else {
      resolved.Horn = 0
    }

    if (msg.Hydraulic_Brake !== undefined) {
      resolved.Hydraulic_Brake = msg.Hydraulic_Brake;
    }
    else {
      resolved.Hydraulic_Brake = 0
    }

    if (msg.High_BeamLigh !== undefined) {
      resolved.High_BeamLigh = msg.High_BeamLigh;
    }
    else {
      resolved.High_BeamLigh = 0
    }

    if (msg.Low_BeamLight !== undefined) {
      resolved.Low_BeamLight = msg.Low_BeamLight;
    }
    else {
      resolved.Low_BeamLight = 0
    }

    if (msg.Turn_Signal !== undefined) {
      resolved.Turn_Signal = msg.Turn_Signal;
    }
    else {
      resolved.Turn_Signal = 0
    }

    if (msg.Double_Light !== undefined) {
      resolved.Double_Light = msg.Double_Light;
    }
    else {
      resolved.Double_Light = 0
    }

    if (msg.Night_Light !== undefined) {
      resolved.Night_Light = msg.Night_Light;
    }
    else {
      resolved.Night_Light = 0
    }

    if (msg.Defroster_Control !== undefined) {
      resolved.Defroster_Control = msg.Defroster_Control;
    }
    else {
      resolved.Defroster_Control = 0
    }

    if (msg.Wiper_Control !== undefined) {
      resolved.Wiper_Control = msg.Wiper_Control;
    }
    else {
      resolved.Wiper_Control = 0
    }

    if (msg.Amble_Brake !== undefined) {
      resolved.Amble_Brake = msg.Amble_Brake;
    }
    else {
      resolved.Amble_Brake = 0
    }

    if (msg.Compartment_Control !== undefined) {
      resolved.Compartment_Control = msg.Compartment_Control;
    }
    else {
      resolved.Compartment_Control = 0
    }

    if (msg.Emergency_Brake !== undefined) {
      resolved.Emergency_Brake = msg.Emergency_Brake;
    }
    else {
      resolved.Emergency_Brake = 0
    }

    if (msg.Load_Brake !== undefined) {
      resolved.Load_Brake = msg.Load_Brake;
    }
    else {
      resolved.Load_Brake = 0
    }

    if (msg.Engine_Start !== undefined) {
      resolved.Engine_Start = msg.Engine_Start;
    }
    else {
      resolved.Engine_Start = 0
    }

    if (msg.Engine_Stop !== undefined) {
      resolved.Engine_Stop = msg.Engine_Stop;
    }
    else {
      resolved.Engine_Stop = 0
    }

    if (msg.Road_DryorWet !== undefined) {
      resolved.Road_DryorWet = msg.Road_DryorWet;
    }
    else {
      resolved.Road_DryorWet = 0
    }

    if (msg.Switch_DynamicorEconomical !== undefined) {
      resolved.Switch_DynamicorEconomical = msg.Switch_DynamicorEconomical;
    }
    else {
      resolved.Switch_DynamicorEconomical = 0
    }

    if (msg.Slope !== undefined) {
      resolved.Slope = msg.Slope;
    }
    else {
      resolved.Slope = 0
    }

    if (msg.Gear !== undefined) {
      resolved.Gear = msg.Gear;
    }
    else {
      resolved.Gear = 0
    }

    if (msg.GPS1_Curvature_cmd !== undefined) {
      resolved.GPS1_Curvature_cmd = msg.GPS1_Curvature_cmd;
    }
    else {
      resolved.GPS1_Curvature_cmd = 0.0
    }

    if (msg.finish_over !== undefined) {
      resolved.finish_over = msg.finish_over;
    }
    else {
      resolved.finish_over = 0
    }

    return resolved;
    }
};

module.exports = adm_cmd;
