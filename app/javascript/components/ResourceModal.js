/**
 * Card for displaying groups of generated codes and allowing download
 *
 * @prop code_csv  - code_csv object with id, name, and created_at
 */

import React from 'react'
import PropTypes from "prop-types"

import request from '../shared/requests/request'
// import CodeCsvModal from './CodeCsvModal'

class ResourceModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    }
  }

  render() {
    return (
      <div className='flex resource-modal-card'>
        <div className='resource-name'>
          {this.props.resource.file_name}
        </div>
      </div>
    )
  }
}

ResourceModal.propTypes = {
  resource: PropTypes.shape({
    id: PropTypes.number.isRequired,
    file_name: PropTypes.string.isRequired,
    created_at: PropTypes.string.isRequired,
  })
}

export default ResourceModal
