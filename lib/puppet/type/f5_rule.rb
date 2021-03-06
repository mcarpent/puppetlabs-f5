Puppet::Type.newtype(:f5_rule) do
  @doc = "Manage F5 rule."

  apply_to_device

  ensurable do
    desc "F5 rule resource state. Valid values are present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:name, :namevar=>true) do
    desc "The rule name."
  end

  newproperty(:definition) do
    desc "The rule definition."
  end
end
