require 'spec_helper'

describe "I18n.l(time, format: :calendar)" do
  around do |example|
    Timecop.freeze(now, &example)
  end

  let :now do
    Time.local(2014, 5, 5, 9, 0)
  end

  subject do
    I18n.l(time, format: :calendar)
  end

  context "today" do
    let(:time) { now }
    it { should == 'Today 9:00am' }
  end

  context "tomorrow" do
    let(:time) { now + 1.day }
    it { should == 'Tomorrow 9:00am' }
  end

  context "yesterday" do
    let(:time) { now - 1.day }
    it { should == 'Yesterday 9:00am' }
  end

  context "rest of this week" do
    let(:time) { now + 2.days }
    it { should == 'Wednesday 9:00am' }
  end

  context "next week" do
    let(:time) { now + 1.week }
    it { should == 'Next Monday 9:00am' }
  end

  context "after next week" do
    let(:time) { now + 2.weeks }
    it { should == 'Monday 19 May 9:00am' }
  end

  context "last week" do
    let(:time) { now - 4.days }
    it { should == 'Last Thursday 9:00am' }
  end

  context "before last week" do
    let(:time) { now - 2.weeks }
    it { should == 'Monday 21 April 9:00am' }
  end
end
