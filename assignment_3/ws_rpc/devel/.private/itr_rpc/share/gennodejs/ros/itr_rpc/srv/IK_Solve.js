// Auto-generated. Do not edit!

// (in-package itr_rpc.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class IK_SolveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.position = null;
      this.orientation = null;
      this.seed = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('seed')) {
        this.seed = initObj.seed
      }
      else {
        this.seed = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IK_SolveRequest
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Check that the constant length array field [position] has the right length
    if (obj.position.length !== 3) {
      throw new Error('Unable to serialize array field position - length must be 3')
    }
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float32(obj.position, buffer, bufferOffset, 3);
    // Check that the constant length array field [orientation] has the right length
    if (obj.orientation.length !== 3) {
      throw new Error('Unable to serialize array field orientation - length must be 3')
    }
    // Serialize message field [orientation]
    bufferOffset = _arraySerializer.float32(obj.orientation, buffer, bufferOffset, 3);
    // Serialize message field [seed]
    bufferOffset = _arraySerializer.float32(obj.seed, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IK_SolveRequest
    let len;
    let data = new IK_SolveRequest(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [orientation]
    data.orientation = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [seed]
    data.seed = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.seed.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'itr_rpc/IK_SolveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a3aaff630c5f2f733715d86140e140ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Header must contain time stamp
    Header header
    
    # Target position (x, y, z)
    float32[3] position
    # Target orientation (roll, pitch, yaw)
    float32[3] orientation
    
    # Seed values for the IK solver
    # Can be empty -> single random value for all joints
    # Can be the number of joints -> specific value for each joint
    float32[] seed
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IK_SolveRequest(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = new Array(3).fill(0)
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = msg.orientation;
    }
    else {
      resolved.orientation = new Array(3).fill(0)
    }

    if (msg.seed !== undefined) {
      resolved.seed = msg.seed;
    }
    else {
      resolved.seed = []
    }

    return resolved;
    }
};

class IK_SolveResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.configuration = null;
    }
    else {
      if (initObj.hasOwnProperty('configuration')) {
        this.configuration = initObj.configuration
      }
      else {
        this.configuration = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IK_SolveResponse
    // Serialize message field [configuration]
    bufferOffset = _arraySerializer.float32(obj.configuration, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IK_SolveResponse
    let len;
    let data = new IK_SolveResponse(null);
    // Deserialize message field [configuration]
    data.configuration = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.configuration.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'itr_rpc/IK_SolveResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '96392331878a87fc2739756372e82087';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Return possible configuration for reaching position
    float32[] configuration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IK_SolveResponse(null);
    if (msg.configuration !== undefined) {
      resolved.configuration = msg.configuration;
    }
    else {
      resolved.configuration = []
    }

    return resolved;
    }
};

module.exports = {
  Request: IK_SolveRequest,
  Response: IK_SolveResponse,
  md5sum() { return '39b92dc189c60778ee4cbbd09d427326'; },
  datatype() { return 'itr_rpc/IK_Solve'; }
};
