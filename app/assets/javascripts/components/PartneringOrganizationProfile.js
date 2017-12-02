

import React from 'react'

/**
*
@prop partnering_organization -partnering organization object
*/

class PartneringOrganizationProfile extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			address:this.props.partneringOrganization.address,
			email:this.props.partneringOrganization.email,
			phone:this.props.partneringOrganization.phone,
			role:this.props.partneringOrganization.role,
			demographic:this.props.partneringOrganization.demographic,
		};
	}

	render() {
			return (
				<div>
					<h1 className = "po-profile-title" > Your Partnering Organization Profile </h1>
				</div>

				);

		}

	} export default PartneringOrganizationProfile


	PartneringOrganizationProfile.propTypes = {
		partnering_organization: React.propTypes.object.isRequired,
	}
