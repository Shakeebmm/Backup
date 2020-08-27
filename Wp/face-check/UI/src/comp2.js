import React, { Component } from "react";
import Webcam from "react-webcam";
import axios from "axios";

export default class Comp2 extends React.Component {
  setRef = webcam => {
    this.webcam = webcam;
  };

  capture = () => {
    const imageSrc = this.webcam.getScreenshot();
    console.log(imageSrc);
    const obj = {
      Name: "shakeeb",
      Img: imageSrc
    };
    console.log(obj);
    // axios
    //   .post("http://localhost:7464/api/FaceCheck/indexFace", obj)
    //   .then(res => console.log(res.data));
  };
  render() {
    const videoConstraints = {
      facingMode: "user"
    };

    return (
      <div>
        <Webcam
          audio={false}
          height={600}
          ref={this.setRef}
          screenshotFormat="image/jpeg"
          width={800}
          videoConstraints={videoConstraints}
        />
        <button onClick={this.capture}>Capture photo</button>
      </div>
    );
  }
}
