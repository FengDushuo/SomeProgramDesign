import React, { Component } from "react";
import { Card, Row, Col} from 'antd';

const { Meta } = Card;

export default class photos extends Component {
  render() {
      return (
        <section id="photos" style={{ background: 'white' }}>
          <div className="row" >
            <div className="twelve columns" >
            <h1>Team</h1>
              <Row>
                <Col sm={4} md={4} lg={4}></Col>
                <Col xs={12} sm={8} md={8} lg={8}>
                  <Card 
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/cssong.png" />}
                  >
                  <Meta style={{ fontSize: '15px'}}
                    title="Changsheng Song"
                    description="Associate professor"
                  />
                  </Card>
                </Col>
                <Col xs={12} sm={8} md={8} lg={8}>                  
                  <Card
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/zbwu.jpg" />}
                  >
                  <Meta style={{ fontSize: '15px' }}
                    title="Zebin Wu"
                    description="Graduate student"
                  />
                  </Card>
                </Col>
              </Row>
              <Row>
                <Col xs={12} sm={8} md={8} lg={8}>
                  <Card
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/zhshen.jpg" />}
                  >
                  <Meta style={{ fontSize: '15px'}}
                    title="Zhong Shen"
                    description="Graduate student"
                  />
                  </Card>
                </Col>
                <Col xs={12} sm={8} md={8} lg={8}>
                  <Card
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/yfxue.jpg" />}
                  >
                  <Meta style={{ fontSize: '15px'}}
                    title="Yufei Xue"
                    description="Graduate student"
                  />
                  </Card>
                </Col>
                <Col xs={12} sm={8} md={8} lg={8}>
                  <Card
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/zhguan.jpg" />}
                  >
                  <Meta style={{ fontSize: '15px'}}
                    title="Zhihao Guan"
                    description="Graduate student"
                  />
                  </Card>
                </Col>
              </Row>
              <Row>
                <Col sm={4} md={4} lg={4}></Col>
                <Col xs={12} sm={8} md={8} lg={8}>
                  <Card 
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/rhxiao.jpg" />}
                  >
                  <Meta style={{ fontSize: '15px'}}
                    title="Runhu Xiao"
                    description="Graduate student"
                  />
                  </Card>
                </Col>
                <Col xs={12} sm={8} md={8} lg={8}>                  
                  <Card
                    hoverable={false}
                    style={{ width: '50%', marginLeft: 'auto', marginRight: 'auto', textAlign: 'center'}}
                    bordered={false}
                    cover={<img alt="example" src="images/dsfeng.jpg" />}
                  >
                  <Meta style={{ fontSize: '15px' }}
                    title="Dushuo Feng"
                    description="Graduate student"
                  />
                  </Card>
                </Col>
              </Row>
            </div>
          </div>
          <hr/>
        </section>
      )
  }
}