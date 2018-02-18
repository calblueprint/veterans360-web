import React from "react"
import PropTypes from "prop-types"
import {Button} from "@blueprintjs/core";

/**
*
@prop partnering_organization -partnering organization object
@prop all_resources
*/

class PartneringOrganizationProfile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: this.props.partneringOrganization.name,
      resources:this.props.all_resources,
      address:this.props.partneringOrganization.address,
      email:this.props.partneringOrganization.email,
      phone:this.props.partneringOrganization.phone,
      role:this.props.partneringOrganization.role,
      demographic:this.props.partneringOrganization.demographic,
    };
  }


  render() {
    let resource_list;
    resource_list = this.state.resources.map((resource) => {
      return (
        <Card interactive={true} elevation={Card.ELEVATION_TWO}>
            <div>
            {resource.file_name}
            {resource.file}
            </div>

        </Card>
      )
    });

    return (
      <div>
        <div className = "po_profile" > Your Profile
          <h4 className = "partnering_organization_email" > Name: {this.state.name} </h4>
          <h4 className = "po_profile" > Email: {this.state.email} </h4>
          <h4 className = "po_role" > Address: {this.state.address} </h4>
          <h4 className = "po_role" > Demographic: {this.state.demographic} </h4>
          <h4 className = "po_role" > Phone Number: {this.state.phone_number} </h4>
          <h4 className = "po_role" > {this.state.role} </h4>
          <h2 className = "resources_list" > {resource_list} </h2>
        </div>
      </div>
    );
  }
}

export default PartneringOrganizationProfile;
