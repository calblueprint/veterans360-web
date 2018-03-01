import { Link } from "react-router"
import React from "react"
import request from "../../shared/requests/request"
import { Button, Dialog, Intent, EditableText } from "@blueprintjs/core"

class PartneringOrganizationNavbar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      values: {
        name: this.props.partneringOrganization.name,
        phone_number: this.props.partneringOrganization.phone_number,
        website: this.props.partneringOrganization.website,
        address: this.props.partneringOrganization.address,
        role: this.props.partneringOrganization.role,
        demographic: this.props.partneringOrganization.demographic,
        description: this.props.partneringOrganization.description
      },
      edit_style: "pt-disabled"
    }
    this.toggleProfile = this.toggleProfile.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.editProfile = this.editProfile.bind(this)
  }

  toggleProfile() {
    if (this.state.isOpen == true) {
      this.setState({ isOpen: false })
    } else {
      this.setState({ isOpen: true })
    }
  }

  handleChange(attribute, value) {
    const values = this.state.values
    values[attribute] = value
    if (this.state.edit_style === "pt-disabled") {
      this.setState({ values: values, edit_style: "default"})
    }
    else {
      this.setState({ values: values });
    }
  }

  editProfile() {
    let params = this.state.values
    const route = `/partnering_organizations/` + this.props.partneringOrganization.id
    request.update(route, params, (response) => {
      window.location.reload()
    }, (error) => {
      alert("There was an error")
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
          <h5 className="profile-titles">Name</h5>
          <EditableText
            defaultValue = {this.state.values.name}
            className="profile-text"
            onChange = {str => this.handleChange("name", str)}
            />
          <h5 className="profile-titles">Phone Number</h5>
          <EditableText
            defaultValue = {this.state.values.phone_number}
            className="profile-text"
            onChange = {str => this.handleChange("phone_number", str)}
          />
          <h5 className="profile-titles">Website</h5>
          <EditableText
            defaultValue = {this.state.values.website}
            className="profile-text"
            onChange = {str => this.handleChange("website", str)}
          />
          <h5 className="profile-titles">Address</h5>
          <EditableText
            defaultValue = {this.state.values.address}
            className="profile-text"
            onChange = {str => this.handleChange("address", str)}
            />
          <h5 className="profile-titles">Role</h5>
          <EditableText
            defaultValue = {this.state.values.role}
            className="profile-text"
            onChange = {str => this.handleChange("role", str)}
            />
          <h5 className="profile-titles">Demographic</h5>
          <EditableText
            defaultValue = {this.state.values.demographic}
            className="profile-text"
            onChange = {str => this.handleChange("demographic", str)}
            />
          <h5 className="profile-titles">Description</h5>
          <EditableText
            defaultValue = {this.state.values.description}
            className="profile-text"
            onChange = {str => this.handleChange("description", str)}
            />
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
            <a href={`/partnering_organizations/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
            <a href={`/partnering_organizations/veterans`}><button className="pt-button pt-minimal pt-icon-document">Veterans</button></a>
            <span className="pt-navbar-divider"></span>
            <Button className="pt-button pt-minimal pt-icon-user" onClick={this.toggleProfile}>Profile</Button>
            <a href={`/partnering_organizations/sign_out`} data-method="delete"><button className="pt-button pt-minimal pt-icon-log-out">Log out</button></a>
          </div>
        </nav>
        {this.renderProfile()}
      </div>
    )
  }
}

export default PartneringOrganizationNavbar
