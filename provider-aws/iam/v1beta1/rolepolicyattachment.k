"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import k8s.apimachinery.pkg.apis.meta.v1


schema RolePolicyAttachment:
    r"""
    RolePolicyAttachment is the Schema for the RolePolicyAttachments API. Attaches a Managed IAM Policy to an IAM role

    Attributes
    ----------
    apiVersion : str, default is "iam.aws.upbound.io/v1beta1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "RolePolicyAttachment", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, optional
        metadata
    spec : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpec, default is Undefined, required
        spec
    status : IamAwsUpboundIoV1beta1RolePolicyAttachmentStatus, default is Undefined, optional
        status
    """


    apiVersion: "iam.aws.upbound.io/v1beta1" = "iam.aws.upbound.io/v1beta1"

    kind: "RolePolicyAttachment" = "RolePolicyAttachment"

    metadata?: v1.ObjectMeta

    spec: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpec

    status?: IamAwsUpboundIoV1beta1RolePolicyAttachmentStatus


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpec:
    r"""
    RolePolicyAttachmentSpec defines the desired state of RolePolicyAttachment

    Attributes
    ----------
    deletionPolicy : str, default is "Delete", optional
        DeletionPolicy specifies what will happen to the underlying external
        when this managed resource is deleted - either "Delete" or "Orphan" the
        external resource.
        This field is planned to be deprecated in favor of the ManagementPolicies
        field in a future release. Currently, both could be set independently and
        non-default values would be honored if the feature flag is enabled.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
    forProvider : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProvider, default is Undefined, required
        for provider
    initProvider : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProvider, default is Undefined, optional
        init provider
    managementPolicies : [str], default is ["*"], optional
        THIS IS A BETA FIELD. It is on by default but can be opted out
        through a Crossplane feature flag.
        ManagementPolicies specify the array of actions Crossplane is allowed to
        take on the managed and external resources.
        This field is planned to replace the DeletionPolicy field in a future
        release. Currently, both could be set independently and non-default
        values would be honored if the feature flag is enabled. If both are
        custom, the DeletionPolicy field will be ignored.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
        and this one: https://github.com/crossplane/crossplane/blob/444267e84783136daa93568b364a5f01228cacbe/design/one-pager-ignore-changes.md
    providerConfigRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecProviderConfigRef, default is Undefined, optional
        provider config ref
    publishConnectionDetailsTo : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsTo, default is Undefined, optional
        publish connection details to
    writeConnectionSecretToRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecWriteConnectionSecretToRef, default is Undefined, optional
        write connection secret to ref
    """


    deletionPolicy?: "Orphan" | "Delete" = "Delete"

    forProvider: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProvider

    initProvider?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProvider

    managementPolicies?: [str] = ["*"]

    providerConfigRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecProviderConfigRef

    publishConnectionDetailsTo?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsTo

    writeConnectionSecretToRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecWriteConnectionSecretToRef


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProvider:
    r"""
    iam aws upbound io v1beta1 role policy attachment spec for provider

    Attributes
    ----------
    policyArn : str, default is Undefined, optional
        The ARN of the policy you want to apply
    policyArnRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnRef, default is Undefined, optional
        policy arn ref
    policyArnSelector : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnSelector, default is Undefined, optional
        policy arn selector
    role : str, default is Undefined, optional
        The name of the IAM role to which the policy should be applied
    roleRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleRef, default is Undefined, optional
        role ref
    roleSelector : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleSelector, default is Undefined, optional
        role selector
    """


    policyArn?: str

    policyArnRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnRef

    policyArnSelector?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnSelector

    role?: str

    roleRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleRef

    roleSelector?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleSelector


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnRef:
    r"""
    Reference to a Policy in iam to populate policyArn.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnRefPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnSelector:
    r"""
    Selector for a Policy in iam to populate policyArn.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnSelectorPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderPolicyArnSelectorPolicy:
    r"""
    Policies for selection.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleRef:
    r"""
    Reference to a Role in iam to populate role.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleRefPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleSelector:
    r"""
    Selector for a Role in iam to populate role.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleSelectorPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecForProviderRoleSelectorPolicy:
    r"""
    Policies for selection.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProvider:
    r"""
    THIS IS A BETA FIELD. It will be honored
    unless the Management Policies feature flag is disabled.
    InitProvider holds the same fields as ForProvider, with the exception
    of Identifier and other resource reference fields. The fields that are
    in InitProvider are merged into ForProvider when the resource is created.
    The same fields are also added to the terraform ignore_changes hook, to
    avoid updating them after creation. This is useful for fields that are
    required on creation, but we do not desire to update them after creation,
    for example because of an external controller is managing them, like an
    autoscaler.

    Attributes
    ----------
    policyArn : str, default is Undefined, optional
        The ARN of the policy you want to apply
    policyArnRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnRef, default is Undefined, optional
        policy arn ref
    policyArnSelector : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnSelector, default is Undefined, optional
        policy arn selector
    role : str, default is Undefined, optional
        The name of the IAM role to which the policy should be applied
    roleRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleRef, default is Undefined, optional
        role ref
    roleSelector : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleSelector, default is Undefined, optional
        role selector
    """


    policyArn?: str

    policyArnRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnRef

    policyArnSelector?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnSelector

    role?: str

    roleRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleRef

    roleSelector?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleSelector


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnRef:
    r"""
    Reference to a Policy in iam to populate policyArn.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnRefPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnSelector:
    r"""
    Selector for a Policy in iam to populate policyArn.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnSelectorPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderPolicyArnSelectorPolicy:
    r"""
    Policies for selection.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleRef:
    r"""
    Reference to a Role in iam to populate role.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleRefPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleSelector:
    r"""
    Selector for a Role in iam to populate role.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleSelectorPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecInitProviderRoleSelectorPolicy:
    r"""
    Policies for selection.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecProviderConfigRef:
    r"""
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecProviderConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecProviderConfigRefPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecProviderConfigRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsTo:
    r"""
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToConfigRef, default is Undefined, optional
        config ref
    metadata : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToMetadata, default is Undefined, optional
        metadata
    name : str, default is Undefined, required
        Name is the name of the connection secret.
    """


    configRef?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToConfigRef

    metadata?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToMetadata

    name: str


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToConfigRef:
    r"""
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToConfigRefPolicy


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToConfigRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecPublishConnectionDetailsToMetadata:
    r"""
    Metadata is the metadata for connection secret.

    Attributes
    ----------
    annotations : {str:str}, default is Undefined, optional
        Annotations are the annotations to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.annotations".
        - It is up to Secret Store implementation for others store types.
    labels : {str:str}, default is Undefined, optional
        Labels are the labels/tags to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.labels".
        - It is up to Secret Store implementation for others store types.
    $type : str, default is Undefined, optional
        Type is the SecretType for the connection secret.
        - Only valid for Kubernetes Secret Stores.
    """


    annotations?: {str:str}

    labels?: {str:str}

    $type?: str


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentSpecWriteConnectionSecretToRef:
    r"""
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.
    This field is planned to be replaced in a future release in favor of
    PublishConnectionDetailsTo. Currently, both could be set independently
    and connection details would be published to both without affecting
    each other.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the secret.
    namespace : str, default is Undefined, required
        Namespace of the secret.
    """


    name: str

    namespace: str


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentStatus:
    r"""
    RolePolicyAttachmentStatus defines the observed state of RolePolicyAttachment.

    Attributes
    ----------
    atProvider : IamAwsUpboundIoV1beta1RolePolicyAttachmentStatusAtProvider, default is Undefined, optional
        at provider
    conditions : [IamAwsUpboundIoV1beta1RolePolicyAttachmentStatusConditionsItems0], default is Undefined, optional
        Conditions of the resource.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """


    atProvider?: IamAwsUpboundIoV1beta1RolePolicyAttachmentStatusAtProvider

    conditions?: [IamAwsUpboundIoV1beta1RolePolicyAttachmentStatusConditionsItems0]

    observedGeneration?: int


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentStatusAtProvider:
    r"""
    iam aws upbound io v1beta1 role policy attachment status at provider

    Attributes
    ----------
    id : str, default is Undefined, optional
        id
    policyArn : str, default is Undefined, optional
        The ARN of the policy you want to apply
    role : str, default is Undefined, optional
        The name of the IAM role to which the policy should be applied
    """


    id?: str

    policyArn?: str

    role?: str


schema IamAwsUpboundIoV1beta1RolePolicyAttachmentStatusConditionsItems0:
    r"""
    A Condition that may apply to a resource.

    Attributes
    ----------
    lastTransitionTime : str, default is Undefined, required
        LastTransitionTime is the last time this condition transitioned from one
        status to another.
    message : str, default is Undefined, optional
        A Message containing details about this condition's last transition from
        one status to another, if any.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, default is Undefined, required
        A Reason for this condition's last transition from one status to another.
    status : str, default is Undefined, required
        Status of this condition; is it currently True, False, or Unknown?
    $type : str, default is Undefined, required
        Type of this condition. At most one of each condition type may apply to
        a resource at any point in time.
    """


    lastTransitionTime: str

    message?: str

    observedGeneration?: int

    reason: str

    status: str

    $type: str


