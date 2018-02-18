import { Link } from 'react-router'
import React from 'react'

class PartneringOrganizationNavbar extends React.Component {
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
    console.log("hello")
    return (
      <Dialog
        iconName="user"
        isOpen={this.state.isOpen}
        onClose={this.toggleProfile}
        title="Profile"
      >
        <div className="pt-dialog-body">
          <h4 className = "partnering_organization_email" > Name: {this.props.partneringOrganization.name} </h4>
          <h4 className = "po_profile" > Email: {this.props.partneringOrganization.email} </h4>
          <h4 className = "po_role" > Address: {this.props.partneringOrganization.address} </h4>
          <h4 className = "po_role" > Demographic: {this.props.partneringOrganization.demographic} </h4>
          <h4 className = "po_role" > Phone Number: {this.props.partneringOrganization.phone_number} </h4>
          <h4 className = "po_role" > {this.props.partneringOrganization.role} </h4>
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
            <a href={`/partnering_organization/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
            <span className="pt-navbar-divider"></span>
            <button className="pt-button pt-minimal pt-icon-user" onClick={this.toggleProfile}>Profile</button>
            <a href={`/partnering_organizations/sign_out`} data-method="delete"><button className="pt-button pt-minimal pt-icon-log-out">Log out</button></a>
          </div>
        </nav>
      </div>
    )
  }
}

export default PartneringOrganizationNavbar
