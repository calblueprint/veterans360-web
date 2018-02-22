import React from "react"
import { Card, Button } from "@blueprintjs/core"

// @props po_subscriptionsjk dont need this prop
// @props partnering organization

class PartneringOrgSubscriptions extends React.Component {
  constructor(props) {
    super(props)

  };

  render() {
    let subscription_list;
    subscription_list = this.props.subscribers.map((subscriber, i) => {
      return (
        <Card interactive={true} elevation={Card.ELEVATION_TWO}>
        <div key={i}>
          <h4> {subscriber.first_name} </h4>

          <h4>  {subscriber.last_name} </h4>
          <p> {subscriber.email} </p>
          <p> {subscriber.military_branch} </p>
        </div>
        </Card>
      )
    });

    return (
      <div>
        <div className="po_profile"> 
        </div>
        {subscription_list}
      </div>
    )
  }
}
export default PartneringOrgSubscriptions
