import React from "react"
import { Card, Button } from "@blueprintjs/core"


class VeteranModal extends React.Component {
  constructor(props) {
    super(props)
  };

  render() {
    return (
      <div>
        <Card interactive={true} elevation={Card.ELEVATION_TWO}>
          <div>
            <h4> {this.props.veteran.first_name} {this.props.veteran.last_name}</h4>
            <p> {this.props.veteran.email} </p>
            <p> {this.props.veteran.military_branch} </p>
            <p> {this.props.veteran.address} </p>
            <p> {this.props.veteran.phone_number} </p>
          </div>
        </Card>
      </div>
    )
  }
}
export default VeteranModal
