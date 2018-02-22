import React from "react"

import NavbarModal from '../shared/NavbarModal.js'


class PartneringOrganizationNavbar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      profile: {
        name: this.props.partneringOrganization.name,
        phone_number: this.props.partneringOrganization.phone_number,
        website: this.props.partneringOrganization.website,
        address: this.props.partneringOrganization.address,
        role: this.props.partneringOrganization.role,
        demographic: this.props.partneringOrganization.demographic,
        description: this.props.partneringOrganization.description
      },
    }
  }

  renderNavbarElements() {
    return (
      <a href={`/partnering_organizations/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
    )
  }

  render() {
    return (
      <NavbarModal
        profile={this.state.profile}
        profile_id={this.props.partneringOrganization.id}
        edit_route="/partnering_organizations/"
        renderNavbarElements={this.renderNavbarElements}
      />
    )
  }
}

export default PartneringOrganizationNavbar
