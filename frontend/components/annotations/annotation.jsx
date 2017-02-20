import React from 'react';
import Quill from 'quill';

class Annotation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      text: '',
    };
  }

  componentDidMount() {
    this.quill = new Quill('#annotationText');
    if (this.props.selectedId !== null) {
      this.quill.setContents(JSON.parse(this.props.fetchAnnotation()));
      this.quill.disable();
    }
  }

  render() {
    return (
      <section className="annotation-bar">
        <div className="arrow" />
        <aside style={{ top: this.props.top }} className="annotation-container">
          <div id="annotationText" />
          <button onClick={this.props.toggleAnnotation} className="btn btn-square">Cancel</button>
        </aside>
      </section>
    );
  }
}

Annotation.propTypes = {
  fetchAnnotation: React.PropTypes.func.isRequired,
  selectedId: React.PropTypes.number,
  toggleAnnotation: React.PropTypes.func.isRequired,
  top: React.PropTypes.number.isRequired,
};

Annotation.defaultProps = {
  selectedId: null,
};

export default Annotation;
