import React from "react"
import PropTypes from "prop-types"

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
		console.log(this.state.resources)

			resource_list = this.state.resources.map((resource) => {
				return (
					<div>
					 {resource.file_name}
					 	</div>
				)
				console.log(resource)

			});

console.log(resource_list)
		return (
			<div className = "po_profile" > Your Profile
				<h4 className = "partnering_organization_email" > Name: {this.state.name} </h4>
				<h4 className = "po_role" > Email: {this.state.email} </h4>
				<h4 className = "po_role" > Address: {this.state.address} </h4>
				<h4 className = "po_role" > Demographic: {this.state.demographic} </h4>
				<h4 className = "po_role" > Phone Number: {this.state.phone_number} </h4>
				<h4 className = "po_role" > {this.state.role} </h4>
				<h2 className = "resources_list" > {resource_list} </h2>
		);
	}
}

export default PartneringOrganizationProfile;


	 PartneringOrganizationProfile.propTypes = {
	 	partnering_organization: React.propTypes.object,
	//

	// export default PartneringOrganizationProfile
