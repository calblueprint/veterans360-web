import React from "react"

import NavbarModal from '../shared/NavbarModal.js'

class AdminNavbar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      profile: {
        first_name: this.props.admin.first_name,
        last_name: this.props.admin.last_name,
        email: this.props.admin.email,
        description: this.props.admin.description,
      }
    }
  }

  renderNavbarElements() {
    return (
      <div>
        <a href={`/admins/applications`}><button className="pt-button pt-minimal pt-icon-comparison">Applications</button></a>
        <a href={`/admins/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
      </div>
    )
  }

  render() {
    return (
      <NavbarModal
        profile={this.state.profile}
        profile_id={this.props.admin.id}
        edit_route="/admins/"
        renderNavbarElements={this.renderNavbarElements}
      />
    )
  }
}

export default AdminNavbar
