require 'spec_helper'

describe "I18n.l(time, format: :calendar)" do
  around do |example|
    Time.use_zone('London') do
      Timecop.freeze(now, &example)
    end
  end

  let :now do
    Time.utc(2014, 5, 5, 8, 0)
  end

  subject do
    I18n.l(time.in_time_zone(Time.zone), format: :calendar)
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

  context "in a different timezone" do
    let(:time) { now }
    it { Time.use_zone('Paris') { should == 'Today 10:00am' } }
  end
end
