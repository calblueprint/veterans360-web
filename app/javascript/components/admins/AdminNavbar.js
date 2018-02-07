import { Link } from 'react-router'
import React from 'react'
import { Button, Dialog, Intent } from "@blueprintjs/core"


class AdminNavbar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false
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
  renderProfile() {
    return (
      <Dialog
          iconName="user"
          isOpen={this.state.isOpen}
          onClose={this.toggleProfile}
          title="Profile"
        >
          <div className="pt-dialog-body">
            <h6>Name</h6> {this.props.admin.first_name + " " + this.props.admin.last_name}
            <h6>Email</h6> {this.props.admin.email}
            <h6>Description</h6> {this.props.admin.description}
          </div>
          <div className="pt-dialog-footer">
            <div className="pt-dialog-footer-actions">
              <Button
                intent={Intent.PRIMARY}
                onClick={this.toggleProfile}
                text="Close"
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
