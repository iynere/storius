import React from 'react';
import Quill from 'quill';

class StoriBody extends React.Component {
  componentDidMount() {
    this.quill = new Quill('#storiText');
    this.quill.setContents(JSON.parse(this.props.stori.content));
    this.quill.disable();
  }

  render() {
    return (
      <div>
        <section className="stori-content column bg-white">
          <div className="primary">
            <h3>Text for {this.props.stori.title}</h3>
            <div id="storiText" className="text" />
          </div>
          <div className="secondary margin-top-1rem">
            <p className="annotation-label">
              About {`"${this.props.stori.title}"`}
            </p>
          </div>
        </section>
      </div>
    );
  }
}

export default StoriBody;