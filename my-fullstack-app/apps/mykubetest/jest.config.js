module.exports = {
  name: 'mykubetest',
  preset: '../../jest.config.js',
  coverageDirectory: '../../coverage/apps/mykubetest',
  snapshotSerializers: [
    'jest-preset-angular/AngularSnapshotSerializer.js',
    'jest-preset-angular/HTMLCommentSerializer.js'
  ]
};
