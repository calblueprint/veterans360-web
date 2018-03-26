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
        description: this.props.partneringOrganization.description,
        section: this.props.partneringOrganization.section,
        category_ids: this.props.po_categories.map((x) => {return x.id})
      },
    }
  }

  renderNavbarElements() {
    return (
      <div>
        <a href={`/partnering_organizations/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
        <a href={`/partnering_organizations/veterans`}><button className="pt-button pt-minimal pt-icon-document">Veterans</button></a>
      </div>
    )
  }

  render() {
    return (
      <NavbarModal
        profile={this.state.profile}
        profile_id={this.props.partneringOrganization.id}
        edit_route="/partnering_organizations/"
        renderNavbarElements={this.renderNavbarElements}
        categories={this.props.categories}
      />
    )
  }
}

export default PartneringOrganizationNavbar
