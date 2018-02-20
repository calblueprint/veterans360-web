import React from "react"

// @props po_subscriptionsjk dont need this prop
// @props partnering organization

class PartneringOrgSubscriptions extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      subscriptions = this.props.subscriptions,
    };
  }

  render() {
    let subscription_list;
    subscription_list = this.state.subscriptions.map((subscription) => {
      return (
        <div>
        {current_partnering_organization.subscriptions}
        </div>
      )
  });
    return {
      <div>
      <div className = "po_profile" > Your Subscribers
      <h4>  {subscription_list}</h4>
      </div>
    }


}
export default PartneringOrgSubscriptions;
