RSpec.shared_examples "a git thin repository" do
  describe "cloning" do
    it "creates a working copy of the repo" do
      subject.clone(remote)
      expect(subject.exist?).to be_truthy
    end

    it "sets the remote origin url to the provided url" do
      subject.clone(remote)
      expect(subject.origin).to eq remote
    end

    it "sets the remote cache url to the path to the cache repo" do
      subject.clone(remote)
      expect(subject.cache).to eq cacherepo.git_dir.to_s
    end

    it "adds the cache repo to the alternates file" do
      subject.clone(remote)
      expect(subject.alternates.to_a).to eq [File.realpath(File.join(cacherepo.git_dir, 'objects'))]
    end
  end
end
