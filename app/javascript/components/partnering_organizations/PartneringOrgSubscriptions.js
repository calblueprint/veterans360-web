import React from "react"
import { Card, Button } from "@blueprintjs/core"

// @props partnering organization

class PartneringOrgSubscriptions extends React.Component {
  constructor(props) {
    super(props)
  };

  render() {
    let subscription_list;
    subscription_list = this.props.veterans.map((veteran, i) => {
      return (
        <li key={i}>
          <Card interactive={true} elevation={Card.ELEVATION_TWO}>
            <div>
              <h4> {veteran.first_name} {veteran.last_name}</h4>
              <p> {veteran.email} </p>
              <p> {veteran.military_branch} </p>
            </div>
          </Card>
        </li>
      )
    });
    return (
      <div>
        <ul>
        {subscription_list}
        </ul>
      </div>
    )
  }
}
export default PartneringOrgSubscriptions
