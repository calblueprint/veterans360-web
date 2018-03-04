import React from "react"
import { Button, Dialog, Intent, EditableText } from "@blueprintjs/core"

import request from "../../shared/requests/request"


class NavbarModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      edit_style: "pt-disabled",
      profile: this.props.profile
    }
    this.toggleProfile = this.toggleProfile.bind(this)
    this.editProfile = this.editProfile.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  toggleProfile() {
    if (this.state.isOpen == true) {
      this.setState({ isOpen: false })
    } else {
      this.setState({ isOpen: true })
    }
  }

  handleChange(event) {
    const profile = this.state.profile
    profile[event.target.name] = event.target.value
    if (this.state.edit_style === "pt-disabled") {
      this.setState({ profile: profile, edit_style: "default"})
    }
    else {
      this.setState({ profile: profile });
    }
  }

  editProfile() {
    let params = this.state.profile
    const route = this.props.edit_route + this.props.profile_id
    request.update(route, params, (response) => {
      window.location.reload()
    }, (error) => {
      alert("There was an error")
    })
  }

  formatString(str) {
    return (str.charAt(0).toUpperCase() + str.slice(1)).replace("_"," ")
  }

  renderProfileElements() {
    return Object.entries(this.state.profile).map((profile) => {
      return (
        <div key={profile[0]}>
          <h5 className="profile-titles">{this.formatString(profile[0])}</h5>
          <input
            value={profile[1]}
            name={profile[0]}
            className="profile-text pt-input"
            type="text"
            onChange={this.handleChange}
          />
        </div>
      )
    })
  }

  renderProfile() {
    return (
      <Dialog
        iconName="user"
        isOpen={this.state.isOpen}
        onClose={this.toggleProfile}
        title="Profile"
      >
        <div className="pt-dialog-body">
          {this.renderProfileElements()}
        </div>
        <div className="pt-dialog-footer">
          <div className="pt-dialog-footer-actions">
            <Button
              intent={Intent.PRIMARY}
              onClick={this.toggleProfile}
              text="Close"
            />
            <Button
              onClick={this.editProfile}
              text="Edit"
              className={this.state.edit_style}
            />
          </div>
        </div>
      </Dialog>
    )
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
        {this.renderProfile()}
      </div>
    )
  }
}

export default NavbarModal
