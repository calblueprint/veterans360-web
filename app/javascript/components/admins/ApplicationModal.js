import React from 'react'
import PropTypes from "prop-types"
import { Card, Button } from "@blueprintjs/core"
import request from '../../shared/requests/request'


class ResourceModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    }
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
          Role: {this.props.application.role}
        </p>
        {this.props.application.approval_status ? (
          <div>
            <p className="approved-status">
              Approved Application!
            </p>
            <a href={`/partnering_organizations/` + this.props.application.id} data-method="delete" data-confirm="This will delete the resource, are you sure?">
              <Button className='reject-po'>
                Delete
              </Button>
            </a>
          </div>
        ) : (
          <div>
            <p className="pending-status">
              Pending Approval
            </p>
            <a href={`/partnering_organizations/` + this.props.application.id + `/approve`} data-method="patch">
              <Button className='approve-po'>
                Approve
              </Button>
            </a>
            <a href={`/partnering_organizations/` + this.props.application.id} data-method="delete" data-confirm="This will delete the resource, are you sure?">
              <Button className='reject-po'>
                Reject
              </Button>
            </a>
          </div>
        )}
      </Card>
      </div>
    )
  }
}

ResourceModal.propTypes = {
  application: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    phone_number: PropTypes.string.isRequired,
    approval_status: PropTypes.bool.isRequired,
    website: PropTypes.string.isRequired,
  })
}

export default ResourceModal
