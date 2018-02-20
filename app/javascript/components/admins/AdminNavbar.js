import { Link } from 'react-router'
import React from 'react'
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
      }
    }

    this.toggleProfile = this.toggleProfile.bind(this)
    this.renderProfileEdit = this.renderProfileEdit.bind(this)
    this.handleChange = this.handleChange.bind(this)
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
    this.setState({ values: values });
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
            <h6>First Name</h6>
            <EditableText
              defaultValue = {this.state.values.first_name}
              // disabled = true
              onChange = {event => this.handleChange('first_name', event.target.value)}
              />
            <h6>Last Name</h6>
            <EditableText
              defaultValue = {event => this.state.values.last_name}
              // disabled = true
              onChange = {event => this.handleChange('last_name', event.target.value)}
            />
            <h6>Email</h6>
            <EditableText
              defaultValue = {this.state.values.email}
              // disabled = true
              onChange = {event => this.handleChange('email', event.target.value)}
            />
            <h6>Description</h6>
            <EditableText
              defaultValue = {this.state.values.description}
              // disabled = true
              onChange = {event => this.handleChange('description', event.target.value)}
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
                onClick={this.renderProfile}
                text="Edit"
              />
            </div>
          </div>
        </Dialog>
    )
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
