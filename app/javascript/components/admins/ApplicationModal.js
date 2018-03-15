import React from 'react'
import PropTypes from "prop-types"
import { Card, Button } from "@blueprintjs/core"
import request from '../../shared/requests/request'


class ApplicationModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {}
    this.deletePartneringOrganization = this.deletePartneringOrganization.bind(this)
    this.approvePartneringOrganization = this.approvePartneringOrganization.bind(this)
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

  render() {
    return (
      <div>
      <Card interactive={true} elevation={Card.ELEVATION_TWO}>
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
