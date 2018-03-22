import _ from 'underscore'
import React from "react"
import { Button, Checkbox, Dialog, Intent, EditableText } from "@blueprintjs/core"

import request from "../../shared/requests/request"
import ResourceModal from "./ResourceModal.js"

class ProfileModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      profile: this.props.profile
    }
    this.editProfile = this.editProfile.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.handleCheck = this.handleCheck.bind(this)
  }

  handleChange(event) {
    const profile = this.state.profile
    profile[event.target.name] = event.target.value
    this.setState({ profile: profile });
  }

  handleCheck(event) {
    const profile = this.state.profile
    const val = parseInt(event.target.name)
    if (_.contains(profile.category_ids, val)) {
      const index = profile.category_ids.indexOf(val)
      profile.category_ids.splice(index, 1)
    } else {
      profile.category_ids.push(val)
    }
    this.setState({ profile: profile })
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
      if (profile[0] == "category_ids") {
        return this.renderCategorySelection()
      } else if (profile[0] == "resources") {
        return this.renderProfileResources()
      } else {
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
      }
    })
  }

  renderCategorySelection() {
    let cat_section = this.props.categories.map((cat) => {
      return (
        <Checkbox
          key={cat.id}
          checked={_.contains(this.state.profile.category_ids, cat.id)}
          onChange={this.handleCheck}
          label={cat.name}
          name={cat.id}
        />
      )
    })
    return (
      <div key={1} id="category_selection">
        <h5 className="profile-titles">Categories</h5>
        {cat_section}
      </div>
    )
  }

  renderProfileResources() {
    let resource_section = this.state.profile.resources.map((resource) => {
      return (
        <ResourceModal
          key={resource.id}
          resource={resource}
        />
      )
    })
    return (
      <div key={2} id="profile_resource">
        <h5 className="profile-titles">Resources</h5>
        {resource_section}
      </div>
    )
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
            />
          </div>
        </div>
      </Dialog>
    )
  }
}

export default ProfileModal
