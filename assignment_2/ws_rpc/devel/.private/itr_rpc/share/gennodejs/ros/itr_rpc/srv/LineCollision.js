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

class LineCollisionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.start = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LineCollisionRequest
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Check that the constant length array field [start] has the right length
    if (obj.start.length !== 3) {
      throw new Error('Unable to serialize array field start - length must be 3')
    }
    // Serialize message field [start]
    bufferOffset = _arraySerializer.float32(obj.start, buffer, bufferOffset, 3);
    // Check that the constant length array field [goal] has the right length
    if (obj.goal.length !== 3) {
      throw new Error('Unable to serialize array field goal - length must be 3')
    }
    // Serialize message field [goal]
    bufferOffset = _arraySerializer.float32(obj.goal, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LineCollisionRequest
    let len;
    let data = new LineCollisionRequest(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [start]
    data.start = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [goal]
    data.goal = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'itr_rpc/LineCollisionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '503139a359801d22d1f8b49513490455';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Header must contain time stamp
    Header header
    
    # Target line between two points start and goal
    float32[3] start
    float32[3] goal
    
    
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
    const resolved = new LineCollisionRequest(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = new Array(3).fill(0)
    }

    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = new Array(3).fill(0)
    }

    return resolved;
    }
};

class LineCollisionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.free = null;
    }
    else {
      if (initObj.hasOwnProperty('free')) {
        this.free = initObj.free
      }
      else {
        this.free = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LineCollisionResponse
    // Serialize message field [free]
    bufferOffset = _serializer.bool(obj.free, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LineCollisionResponse
    let len;
    let data = new LineCollisionResponse(null);
    // Deserialize message field [free]
    data.free = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'itr_rpc/LineCollisionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '662d0577555df77dcaee5a646dd74f27';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Return true if configuration is possible (grid cells on the line unoccupied)
    bool free
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LineCollisionResponse(null);
    if (msg.free !== undefined) {
      resolved.free = msg.free;
    }
    else {
      resolved.free = false
    }

    return resolved;
    }
};

module.exports = {
  Request: LineCollisionRequest,
  Response: LineCollisionResponse,
  md5sum() { return '707cbc39d27f203bc82c3dbe5b190730'; },
  datatype() { return 'itr_rpc/LineCollision'; }
};
