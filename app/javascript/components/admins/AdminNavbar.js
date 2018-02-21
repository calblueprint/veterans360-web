import { Link } from "react-router"
import React from "react"
import request from "../../shared/requests/request"
import { Button, Dialog, Intent, EditableText } from "@blueprintjs/core"

class AdminNavbar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      values: {
        first_name: this.props.admin.first_name,
        last_name: this.props.admin.last_name,
        email: this.props.admin.email,
        description: this.props.admin.description,
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
    const route = `/admins/` + this.props.admin.id
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
            <h5 className="profile-titles">First Name</h5>
            <EditableText
              defaultValue = {this.state.values.first_name}
              className="profile-text"
              onChange = {str => this.handleChange("first_name", str)}
              />
            <h5 className="profile-titles">Last Name</h5>
            <EditableText
              defaultValue = {this.state.values.last_name}
              className="profile-text"
              onChange = {str => this.handleChange("last_name", str)}
            />
            <h5 className="profile-titles">Email</h5>
            <EditableText
              defaultValue = {this.state.values.email}
              className="profile-text"
              onChange = {str => this.handleChange("email", str)}
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
            <a href={`/admins/applications`}><button className="pt-button pt-minimal pt-icon-comparison">Applications</button></a>
            <a href={`/admins/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
            <span className="pt-navbar-divider"></span>
            <Button text="Profile" className="pt-button pt-minimal pt-icon-user" onClick={this.toggleProfile} />
            <a href={`/admins/sign_out`} data-method="delete"><button className="pt-button pt-minimal pt-icon-log-out">Log out</button></a>
          </div>
        </nav>
        {this.renderProfile()}
      </div>
    )
  }
}

export default AdminNavbar
