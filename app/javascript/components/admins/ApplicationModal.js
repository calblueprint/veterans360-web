import React from 'react'
import PropTypes from "prop-types"
import { Card, Button } from "@blueprintjs/core"

import request from '../../shared/requests/request'
import ProfileModal from '../shared/ProfileModal.js'


class ApplicationModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      profile: {
        name: this.props.application.name,
        phone_number: this.props.application.phone_number,
        website: this.props.application.website,
        address: this.props.application.address,
        description: this.props.application.description,
        category_ids: []
      },
    }
    this.deletePartneringOrganization = this.deletePartneringOrganization.bind(this)
    this.approvePartneringOrganization = this.approvePartneringOrganization.bind(this)
    this.toggleProfile = this.toggleProfile.bind(this)
    this._mounted = false
  }

  componentDidMount() {
    this._mounted = true
    this.getCategories()
  }

  componentWillUnmount() {
    this._mounted = false
  }

  getCategories() {
    const route = `/partnering_organizations/` + this.props.application.id + `/categories`
    request.get(route, (response) => {
      const profile = this.state.profile
      profile["category_ids"] = response.map((x) => {return x.id})
      this._mounted && this.setState({ profile: profile })
    }, (error) => {
      console.log(error)
    })
  }

  deletePartneringOrganization() {
    if (confirm("This will delete the Partnering Organization Permanently")) {
      const route = `/partnering_organizations/` + this.props.application.id
      request.delete(route, (response) => {
        window.location.reload()
      }, (error) => {
        alert("There was an error")
      })
    }
  }

  approvePartneringOrganization() {
    const route = `/partnering_organizations/` + this.props.application.id
    let params = {
      approval_status: true
    }
    request.update(route, params, (response) => {
      window.location.reload()
    }, (error) => {
      alert("There was an error")
    })
  }

  toggleProfile() {
    this.setState({ isOpen: !this.state.isOpen })
  }

  render() {
    return (
      <div>
        <Card interactive={true} elevation={Card.ELEVATION_TWO} onClick={this.toggleProfile}>
          <p>
            Name: {this.props.application.name}
          </p>
          <p>
            Phone Number: {this.props.application.phone_number}
          </p>
          <p>
            Web Site: {this.props.application.website}
          </p>
          <p>
            Description: {this.props.application.description}
          </p>
          {this.props.application.approval_status ? (
            <div>
              <p className="approved-status">
                Approved Application!
              </p>
              <Button className='reject-po' onClick={this.deletePartneringOrganization}>
                Delete
              </Button>
            </div>
          ) : (
            <div>
              <p className="pending-status">
                Pending Approval
              </p>
              <Button className='approve-po' onClick={this.approvePartneringOrganization}>
                Approve
              </Button>
              <Button className='reject-po' onClick={this.deletePartneringOrganization}>
                  Reject
              </Button>
            </div>
          )}
        </Card>
        <ProfileModal
          toggle={this.toggleProfile}
          profile={this.state.profile}
          edit_route="/partnering_organizations/"
          profile_id={this.props.application.id}
          isOpen={this.state.isOpen}
          categories={this.props.categories}
        />
      </div>
    )
  }
}

ApplicationModal.propTypes = {
  application: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    phone_number: PropTypes.string.isRequired,
    approval_status: PropTypes.bool.isRequired,
    website: PropTypes.string.isRequired,
  })
}

export default ApplicationModal
