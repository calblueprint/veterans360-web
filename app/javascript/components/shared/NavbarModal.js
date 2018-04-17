import React from "react"
import { Button, Dialog, Intent, EditableText } from "@blueprintjs/core"

import request from "../../shared/requests/request"
import ProfileModal from './ProfileModal.js'


class NavbarModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
    }
    this.toggleProfile = this.toggleProfile.bind(this)
  }

  toggleProfile() {
    if (this.state.isOpen == true) {
      this.setState({ isOpen: false })
    } else {
      this.setState({ isOpen: true })
    }
  }

  render() {
    return (
      <div>
        <nav className="pt-navbar .modifier">
          <div className="pt-navbar-group pt-align-left">
            <div className="pt-navbar-heading">Veterans 360</div>
          </div>
          <div className="pt-navbar-group pt-align-right">
            {this.props.renderNavbarElements()}
            <span className="pt-navbar-divider"></span>
            <Button text="Edit Profile" className="pt-button pt-minimal pt-icon-user" onClick={this.toggleProfile} />
            <a href={this.props.edit_route + `sign_out`} data-method="delete"><button className="pt-button pt-minimal pt-icon-log-out">Log out</button></a>
          </div>
        </nav>
        <ProfileModal
          toggle={this.toggleProfile}
          profile={this.props.profile}
          edit_route={this.props.edit_route}
          profile_id={this.props.profile_id}
          isOpen={this.state.isOpen}
          categories={this.props.categories}
        />
      </div>
    )
  }
}

export default NavbarModal
