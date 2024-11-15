import React, { Component } from 'react';
import { Carousel } from 'antd';

export default class Alumni extends Component {
  render() {
    return (
      <section id="alumni" style={{ background:'white' }}>
        <div className="row" >
          <div className="twelve columns" >
          <h1>Alumni</h1>
          <Carousel autoplay>
            <div><h3>fds<br/>
                    fds</h3></div>
            <div><h3>fds<br/>
                    fds</h3></div>
          </Carousel>
          </div>
        </div>
      </section>
    );
  }
}