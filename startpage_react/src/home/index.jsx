import React from 'react';
import RaisedButton from 'material-ui/RaisedButton';
import {Tabs, Tab} from 'material-ui/Tabs';
import AppBar from 'material-ui/AppBar';
import {
  blueGrey700, // dark primary color
  blueGrey500, // primary color
  lime500,     // accent color
 } from 'material-ui/styles/colors';

const style = {
  margin: 12,
  color: lime500
};

const BigButton = () => (
  <div>
    <RaisedButton label="Default" style={style} />
    <RaisedButton label="Primary" primary={true} style={style} />
    <RaisedButton label="Secondary" secondary={true} style={style} />
    <RaisedButton label="Disabled" disabled={true} style={style} />
    <br />
    <RaisedButton label="Full width" fullWidth={true} />
  </div>
);

const tabHeaderStyle = {
  backgroundColor: blueGrey700,
  color: '#FFFFFF'
};

const tabStyle = {
  backgroundColor: blueGrey500,
  color: '#FFFFFF'
}


const TabbedHeader = () => (
  <Tabs
    style={tabStyle}
    inkBarStyle={{backgroundColor: lime500}}>
    <Tab label="Home" style={tabHeaderStyle}>
      <BigButton />
    </Tab>
    <Tab label="Work" style={tabHeaderStyle}>
      <div>
        <h2>
          Hello work
        </h2>
      </div>
    </Tab>
  </Tabs>
);

const HomePage = () => (
  <div>
    {/* <AppBar title="Hello!" /> */}
    <TabbedHeader />
    {/* <BigButton /> */}
  </div>
)

export default HomePage;
