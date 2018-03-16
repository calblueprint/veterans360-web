import React from "react"
import { Button, Dialog, Intent, EditableText } from "@blueprintjs/core"

import request from "../../shared/requests/request"


class ProfileModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      edit_style: "pt-disabled",
      profile: this.props.profile
    }
    this.editProfile = this.editProfile.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.handleCheck = this.handleCheck.bind(this)
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

  handleCheck(event) {
    console.log(event)
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
            required
          />
        </div>
      )
    })
  }

  renderCategorySelection() {
    return this.props.categories.map((cat) => {
      return (
        <label key={cat.id} className="pt-control pt-checkbox">
          <input type="checkbox" name={cat.id} onChange={this.handleCheck}/>
          <span className="pt-control-indicator"></span>
          {cat.name}
        </label>
      )
    })
  }

  render() {
    return (
      <Dialog
        iconName="user"
        isOpen={this.props.isOpen}
        onClose={this.props.toggle}
        title="Edit Profile"
      >
        <div className="pt-dialog-body">
          {this.renderProfileElements()}
          <div id="category_seclection">
            <h5 className="profile-titles">Categories</h5>
            {this.renderCategorySelection()}
          </div>
        </div>
        <div className="pt-dialog-footer">
          <div className="pt-dialog-footer-actions">
            <Button
              intent={Intent.PRIMARY}
              onClick={this.props.toggle}
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
}

export default ProfileModal
